chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== 4 move prepare check -1', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Queen move [5,7] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 5; second.depth = 5
            normal_weight()
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([5,7])
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

describe '=== 3 move prepare check -1', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Queen move [4,8] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([5,8])
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

describe '=== 2 move prepare check -1', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Bishop move [4,3] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Bishop')
            expect(ret[1]).to.deep.equal([4,3])
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

describe '=== 2 move think check -1', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Bishop move [4,3] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Bishop')
            expect(ret[1]).to.deep.equal([4,3])
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

describe '=== 1.5 move prepare check -1', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects black Pawn move [7,6] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 0; second.depth = 0
            normal_weight()
            ret = second.prepare(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([7,6])
            expect(ret[2]).to.be.below(9999)
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== 1.5 move think check -1', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects black Pawn move [7,6] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 0; second.depth = 0
            normal_weight()
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([7,6])
            expect(ret[2]).to.be.below(9999)
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== 1 move prepare check -1', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Queen move [6,7] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([6,7])
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

describe '=== 1 move think check -1', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Queen move [6,7] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([6,7])
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
