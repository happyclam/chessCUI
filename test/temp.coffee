chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== tume9-2', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.display()
    describe '--- problem -1', ->
        it 'expects Bishop move [1,8] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Bishop')
            # expect(ret[2]).to.be.above(9999)
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
