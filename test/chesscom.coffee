chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== battle01', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -0', ->
        it 'expects stalemate -0', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([5,7])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== tactics01', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    random_weight = ->
        Piece.Queen.weight = 50 * (1  + Math.random() * 2)
        Piece.Bishop.weight = 3 * (1  + Math.random() * 2)
        Piece.Knight.weight = 3 * (1  + Math.random() * 2)
        Piece.Rook.weight = 5 * (1  + Math.random() * 2)
        Piece.Pawn.weight = 12 * (1  + Math.random() * 2)
        return
    describe '--- problem -0', ->
        it 'expects stalemate -0', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            random_weight()            
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('King')
            expect(ret[1]).to.deep.equal([7,3])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== holly-BOT-01', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,2]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    random_weight = ->
        Piece.Queen.weight = 50 * (1  + Math.random() * 2)
        Piece.Bishop.weight = 3 * (1  + Math.random() * 2)
        Piece.Knight.weight = 3 * (1  + Math.random() * 2)
        Piece.Rook.weight = 5 * (1  + Math.random() * 2)
        Piece.Pawn.weight = 12 * (1  + Math.random() * 2)
        return
    describe '--- problem -0', ->
        it 'expects stalemate -0', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            # random_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([3,5])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
