chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== intro00', ->
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
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,7]))
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
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([2,7])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== intro01', ->
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
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects stalemate -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
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
describe '=== intro02', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -2', ->
        it 'expects stalemate -2', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([7,2])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro03', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -3', ->
        it 'expects stalemate -3', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([3,8])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro04', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -4', ->
        it 'expects stalemate -4', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([4,3])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro05', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -5', ->
        it 'expects stalemate -5', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([1,7])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro05-2', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -5-2', ->
        it 'expects stalemate -5-2', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([2,6])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro06', ->
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
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,6]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -6', ->
        it 'expects stalemate -6', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([6,8])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro06-2', ->
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
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,6]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -6-2', ->
        it 'expects stalemate -6-2', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([4,8])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro06-3', ->
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
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,6]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -6-3', ->
        it 'expects stalemate -6-3', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([2,5])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro07-1', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -7', ->
        it 'expects stalemate -7', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([3,4])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro07-1-1', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,5]))        
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -7-1-1', ->
        it 'expects stalemate -7-1-1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([3,4])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro07-2', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -7-2', ->
        it 'expects stalemate -7-2', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([3,4])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro07-3', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -7-3', ->
        it 'expects stalemate -7-3', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            # expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal(null)
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro08', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [2,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -8', ->
        it 'expects stalemate -8', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([5,8])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro08-1', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -8-1', ->
        it 'expects stalemate -8-1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([1,8])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro08-2', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -8-2', ->
        it 'expects stalemate -8-2', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([5,8])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== intro08-3', ->
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
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -8-3', ->
        it 'expects stalemate -8-3', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([1,8])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
