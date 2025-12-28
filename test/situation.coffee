chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== situation01', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    set_gravity = (seq) ->
        for v in b.pieces
            g = seq
            v.gravity = g
        return
    describe '--- think 3 -1', ->
        it 'expects white Queen move [7,4] -1', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            set_gravity(3.0)
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([7,4])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation02', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    set_gravity = (seq) ->
        for v in b.pieces
            g = seq
            v.gravity = g
        return
    describe '--- prepare 2 -1', ->
        # it 'expects white Knight move [6,3] -2', ->
        it 'expects white Queen move [7,5] -2', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 2; second.depth = 2
            normal_weight()
            set_gravity(3.0)
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            # expect(ret[0].name).to.equal('Knight')
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([7,5])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation03', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    set_gravity = (seq) ->
        for v in b.pieces
            g = seq
            v.gravity = g
        return
    describe '--- prepare 3 -3', ->
        it 'expects white Queen move [7,4] -2', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            set_gravity(3.0)
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([7,4])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation04', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- No blunder move is stored in spare', ->
        it 'expects white Rook move [1,3] -1', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = second.prepare(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([1,3])
            expect(ret[4].koma).to.equal(null)
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation05', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- No blunder move is stored in spare', ->
        it 'expects white Rook move [1,3] -1', ->
            first.pre_select = 20
            second.pre_select = 20
            # first.depth = 3; second.depth = 3
            first.depth = 4; second.depth = 4
            normal_weight()
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([4,1])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation06', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.display()
    random_weight = ->
        Piece.Queen.weight = 50 * (1  + Math.random() * 2)
        Piece.Bishop.weight = 3 * (1  + Math.random() * 2)
        Piece.Knight.weight = 3 * (1  + Math.random() * 2)
        Piece.Rook.weight = 5 * (1  + Math.random() * 2)
        Piece.Pawn.weight = 12 * (1  + Math.random() * 2)
        return
    describe '--- No blunder move is stored in spare', ->
        it 'expects white Rook move [1,3] -1', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            random_weight()
            ret = second.prepare(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([3,2])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation07', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.display()

    random_weight = ->
        Piece.Queen.weight = 50 * (1  + Math.random() * 2)
        Piece.Bishop.weight = 3 * (1  + Math.random() * 2)
        Piece.Knight.weight = 3 * (1  + Math.random() * 2)
        Piece.Rook.weight = 5 * (1  + Math.random() * 2)
        Piece.Pawn.weight = 12 * (1  + Math.random() * 2)
    describe '--- expect Pawn move [3,4] when random_weight', ->
        it 'expects white Rook move [1,3] -1', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            random_weight()
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            # expect(ret[1]).to.deep.equal([3,4])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation08', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- expect Bishop move [5,5] when normal_weight', ->
        it 'expects white Rook move [1,3] -1', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Bishop')
            expect(ret[1]).to.deep.equal([5,5])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation09', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- expect Bishop move [6,3]', ->
        it 'expects white Rook move [1,3] -1', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = second.prepare(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Bishop')
            expect(ret[1]).to.deep.equal([6,3])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation10', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,8]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    set_gravity = (seq) ->
        for v in b.pieces
            g = seq
            v.gravity = g
        return
    describe '--- expect do not sacrifice Bishop -1', ->
        it 'expects Bishop do not move [1,6] -1', ->
            # MOTIGOMA==0 だと24未満だと Ba6の悪手を指す
            # MOTIGOMA==weight/10 だと26未満だと Ba6の悪手を指す
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            set_gravity(3.0)
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            # expect(ret[0].name).not.to.equal('Bishop')
            expect(ret[1]).not.to.deep.equal([1,6])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation11', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [5,4]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    set_gravity = (seq) ->
        for v in b.pieces
            g = seq
            v.gravity = g
        return
    describe '--- expect do not sacrifice Bishop -2', ->
        it 'expects Bishop do not move [1,6] -1', ->
            # MOTIGOMA==0 だと24未満だと Ba6の悪手を指す
            # MOTIGOMA==weight/10 だと26未満だと Ba6の悪手を指す
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            set_gravity(2.25)
            ret = second.prepare(b, first, second.depth, Const.MIN_VALUE)
            # expect(ret[0].name).not.to.equal('Bishop')
            expect(ret[1]).not.to.deep.equal([8,3])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation12', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,6]))
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
    set_gravity = (seq) ->
        for v in b.pieces
            g = seq
            v.gravity = g
        return
    describe '--- expect do not sacrifice Knight -1', ->
        # random_weight()だと悪手を指すケース
        it 'expects Bishop do not move [1,6] -1', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            # random_weight()
            # set_gravity(1.4)
            set_gravity(1.0)
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).not.to.equal('Knight')
            expect(ret[1]).not.to.deep.equal([4,6])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== situation13', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
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
    set_gravity = (seq) ->
        for v in b.pieces
            g = seq
            v.gravity = g
        return
    describe '--- expect choose pin -1', ->
        # Pawn Chainに加点しないと失敗するケース
        it 'expects Bishop move [4,5] -1', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            # random_weight()
            set_gravity(1.0)
            # set_gravity(2.8)
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Bishop')
            # expect(ret[1]).to.deep.equal([4,5])
            expect(ret[1]).to.deep.equal([4,7])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
