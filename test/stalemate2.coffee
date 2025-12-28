chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== stalemate01', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        # b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.display()
    describe '--- problem -1', ->
        it 'expects judge stalemate -1', ->
            ret = b.check_tumi(first.turn)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        console.log(ret)

describe '=== stalemate02', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.display()
    describe '--- problem -1', ->
        it 'expects judge not stalemate -1', ->
            ret = b.check_tumi(first.turn)
            expect(ret[0]).to.equal(false)
            # expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        console.log(ret)

describe '=== stalemate03', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,1]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        # b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.BISHOP, [5,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.display()
    describe '--- problem -1', ->
        it 'expects judge checkmate -1', ->
            ret = b.check_tumi(first.turn)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.CHECKMATE)
    afterEach ->
        console.log(ret)

describe '=== stalemate04', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,1]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        # b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,1]))
        # b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.BISHOP, [5,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.display()
    describe '--- problem -1', ->
        it 'expects judge stalemate -1', ->
            ret = b.check_tumi(second.turn)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        console.log(ret)

describe '=== stalemate05', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,6]))
        # b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,8]))
        # b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.ROOK, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,7]))
        b.display()
    describe '--- problem -1', ->
        it 'expects judge checkmate -1', ->
            ret = b.check_tumi(first.turn)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.CHECKMATE)
    afterEach ->
        console.log(ret)

describe '=== stalemate06', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [3,8]))
        # b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,8]))
        # b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,8]))
        # b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.ROOK, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,7]))
        b.display()
    describe '--- problem -1', ->
        it 'expects judge stalemate -1', ->
            ret = b.check_tumi(second.turn)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        console.log(ret)
