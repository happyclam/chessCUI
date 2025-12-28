chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== stalemate_113-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.display()
    describe '--- problem 113', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([7,1])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_113-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,4]))
        # b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.display()
    describe '--- problem 113', ->
        it 'expects judge stalemate', ->
            ret = b.check_tumi(second.turn)
            console.log(ret)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        b.display()
describe '=== stalemate_113-3', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.display()
    describe '--- problem 113', ->
        it 'expects avoid stalemate', ->
            first.depth = 3; second.depth = 3
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('King')
            expect(ret[1]).to.deep.equal([8,3])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_114-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,4,]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.display()
    describe '--- problem 114', ->
        it 'expects stalemate', ->
            first.depth = 5; second.depth = 5
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Knight')
            expect(ret[1]).to.deep.equal([8,6])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_114-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,4,]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.display()
    describe '--- problem 114', ->
        it 'expects checkmate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Knight')
            expect(ret[1]).to.deep.equal([6,5])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_114-3', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,4,]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,3]))
        # b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.display()
    describe '--- problem 114', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([7,6])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
# describe '=== stalemate_125-1', ->
#     b = null
#     first = null; second = null;
#     rc = null
#     ret = []
#     before ->
#         first = new Player(Const.FIRST, false)
#         second = new Player(Const.SECOND, false)
#     beforeEach ->
#         b = new Board()
#         b.pieces = []
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,5]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
#         b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,2]))
#         b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,5]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,4]))
#         b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [6,1]))
#         b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [2,4]))
#         b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
#         b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [2,8]))
#         b.display()
#     describe '--- problem 125', ->
#         it 'expects stalemate', ->
#             first.depth = 5; second.depth = 5
#             ret = first.think(b, second, first.depth, Const.MAX_VALUE)
#             expect(ret[0].name).to.equal('Rook')
#             expect(ret[1]).to.deep.equal([6,8])
#     afterEach ->
#         console.log(ret) if ret.length > 0
#         if ret[0]?
#             if b.check_move(ret[0], ret[1])
#                 b.move_capture(ret[0], ret[1])
#                 ret[0].status = ret[3]
#         else
#             console.log("AI resigned.")
#         b.display()
describe '=== stalemate_125-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.display()
    describe '--- problem 125', ->
        it 'expects stalemate', ->
            first.depth = 5; second.depth = 5
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([3,5])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_125-3', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [6,8]))
        # b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.display()
    describe '--- problem 125', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([1,8])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_130-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.display()
    describe '--- problem 130', ->
        it 'expects stalemate', ->
            first.depth = 5; second.depth = 5
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([3,4])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_130-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.display()
    describe '--- problem 130', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([3,5])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_130-3', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        # b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.display()
    describe '--- problem 130', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([1,5])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_130-4', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,5]))
        # b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.display()
    describe '--- problem 130', ->
        it 'expects judge stalemate', ->
            ret = b.check_tumi(second.turn)
            console.log(ret)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        b.display()
describe '=== stalemate_130-5', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.display()
    describe '--- problem 130', ->
        # 後手が無理にステイルメイトを避けるとcheckmateされて負けるケース
        it 'expects stalemate', ->
            first.depth = 5; second.depth = 5
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([1,5])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_130-6', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [2,8]))
        b.display()
    describe '--- problem 130', ->
        # 一つ前のテストで後手が無理にステイルメイトを避けるとcheckmateされて負けるケース
        it 'expects checkmate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([2,5])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_130-7', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,5]))
        # b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.display()
    describe '--- problem 130', ->
        it 'expects judge stalemate', ->
            ret = b.check_tumi(second.turn)
            console.log(ret)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        b.display()
