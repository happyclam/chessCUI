chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== 1 move checkmate -1', ->
    b = null
    first = null; second = null;
    rc = null
    ret = []
    before ->
        first = new Player(Const.FIRST, false)
        second = new Player(Const.SECOND, false)
    beforeEach ->
        b = new Board()
        b.pieces = []
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,3]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects black Pawn move [3,4] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            king.castling = false
            king.castled = Const.KING_CASTLING
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 0; second.depth = 0
            normal_weight()
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([3,4])
            expect(ret[2]).to.be.most(Const.MIN_VALUE)
        it 'expects black Pawn move [3,4] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            king.castling = false
            king.castled = Const.QUEEN_CASTLING
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "2,5")[0]
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 0; second.depth = 0
            if b.check_move(piece, [3,4])
                b.move_capture(piece, [3,4])
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0]).to.equal(null)
            expect(ret[2]).to.be.most(Const.MIN_VALUE)
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
