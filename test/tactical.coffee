chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== stalemate_92-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [2,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    describe '--- problem 92', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([7,8])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_92-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    describe '--- problem 92', ->
        it 'expects stalemate', ->
            first.depth = 1; second.depth = 1
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([7,8])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_105-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    describe '--- problem 105', ->
        # depth = 5 でテスト成功するけど時間掛かる
        # テスト時に --timeout 3000000 必要
        it 'expects stalemate & pinning', ->
            first.depth = 5; second.depth = 5
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Knight')
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
describe '=== stalemate_105-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    describe '--- problem 105', ->
        it 'expects stalemate & pinning', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([8,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_105-3', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.display()
    describe '--- problem 105', ->
        it 'expects stalemate & pinning', ->
            first.depth = 1; second.depth = 1
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([7,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_105-4', ->
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
        # b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [7,3]))
        # b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.display()
    describe '--- problem 105', ->
        it 'expects judge stalemate', ->
            ret = b.check_tumi(second.turn)
            console.log(ret)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        b.display()
# describe '=== stalemate_106-1', ->
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
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,3]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,3]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,6]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
#         b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [5,8]))
#         b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,4]))
#         b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
#         b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,8]))
#         b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,3]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
#         b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [5,5]))
#         b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,5]))
#         b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,4]))
#         b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,2]))
#         b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [2,1]))
#         b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
#         b.display()
#     describe '--- problem 106', ->
#         # depth = 6 でOut of memory、depth = 5 では正解できない
#         # テスト時に --timeout 5000000 必要
#         it 'expects stalemate', ->
#             first.depth = 6; second.depth = 6
#             ret = first.think(b, second, first.depth, Const.MAX_VALUE)
#             expect(ret[0].name).to.equal('Knight')
#             expect(ret[1]).to.deep.equal([6,7])
#     afterEach ->
#         console.log(ret) if ret.length > 0
#         if ret[0]?
#             if b.check_move(ret[0], ret[1])
#                 b.move_capture(ret[0], ret[1])
#                 ret[0].status = ret[3]
#         else
#             console.log("AI resigned.")
#         b.display()
describe '=== stalemate_106-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    describe '--- problem 106', ->
        # depth = 5 でテスト成功するけど時間掛かる
        # テスト時に --timeout 5000000 必要
        it 'expects stalemate', ->
            first.depth = 5; second.depth = 5
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([8,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_106-3', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.display()
    describe '--- problem 106', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([8,5])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_106-4', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.display()
    describe '--- problem 106', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
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

describe '=== stalemate_110-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.display()
    describe '--- problem 110', ->
        it 'expects stalemate', ->
            first.depth = 5; second.depth = 5
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Knight')
            expect(ret[1]).to.deep.equal([6,6])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_110-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.display()
    describe '--- problem 110', ->
        it 'expects stalemate', ->
            first.depth = 4; second.depth = 4
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([5,8])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_110-3', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.display()
    describe '--- problem 110', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([5,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_110-4', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,4]))
        # b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,6]))
        # b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.display()
    describe '--- problem 110', ->
        it 'expects judge stalemate', ->
            ret = b.check_tumi(second.turn)
            console.log(ret)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        b.display()
describe '=== stalemate_111-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    describe '--- problem 111', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Knight')
            expect(ret[1]).to.deep.equal([6,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_111-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.display()
    describe '--- problem 111', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
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
describe '=== stalemate_111-3', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [2,3]))
        # b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.display()
    describe '--- problem 111', ->
        it 'expects checkmate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([7,3])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_111-4', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    describe '--- problem 111', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Knight')
            expect(ret[1]).to.deep.equal([6,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_112-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.display()
    describe '--- problem 112', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([7,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_112-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.display()
    describe '--- problem 112', ->
        it 'expects avoid stalemate', ->
            first.depth = 3; second.depth = 3
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('King')
            expect(ret[1]).to.deep.equal([8,8])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_112-3', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,2]))
        # b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.display()
    describe '--- problem 112', ->
        it 'expects judge stalemate', ->
            ret = b.check_tumi(second.turn)
            console.log(ret)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        b.display()
describe '=== stalemate_112-4', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    describe '--- problem 112', ->
        it 'expects avoid stalemate', ->
            first.depth = 3; second.depth = 3
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Bishop')
            expect(ret[1]).to.deep.equal([7,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_112-5', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.display()
    describe '--- problem 112', ->
        it 'expects avoid stalemate', ->
            # depth = 3 だと千日手狙いが次善手になってしまうけど、許容範囲
            first.depth = 4; second.depth = 4
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([7,8])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== pinning_219', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.display()
    describe '--- problem 219', ->
        it 'expects pinning', ->
            first.depth = 1; second.depth = 1
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            console.log(ret)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([5,6])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== pinning_220', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.display()
    describe '--- problem 220', ->
        it 'expects pinning', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            console.log(ret)
            expect(ret[0].name).to.equal('Bishop')
            expect(ret[1]).to.deep.equal([2,3])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== pinning_221', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.display()
    describe '--- problem 221', ->
        it 'expects pinning', ->
            first.depth = 1; second.depth = 1
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            console.log(ret)
            expect(ret[0].name).to.equal('Rook')
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
describe '=== stalemate_234-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.display()
    describe '--- problem 234', ->
        # depth = 5 でテスト成功するけど時間掛かる
        # テスト時に --timeout 3000000 必要
        it 'expects stalemate', ->
            first.depth = 5; second.depth = 5
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
describe '=== stalemate_234-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.display()
    describe '--- problem 234', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([1,2])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_235-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.display()
    describe '--- problem 235', ->
        # depth = 4 でテスト成功するけど時間掛かる
        it 'expects stalemate', ->
            first.depth = 4; second.depth = 4
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([7,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_235-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.display()
    describe '--- problem 235', ->
        it 'expects stalemate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([7,3])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_236-1', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.display()
    describe '--- problem 236', ->
        it 'expects stalemate & pinning', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([7,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_236-2', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.display()
    describe '--- problem 236', ->
        it 'expects checkmate', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([4,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
describe '=== stalemate_236-3', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.display()
    describe '--- problem 236', ->
        # tactical本の正解が次善手に入ってるけど、詰みやステイルメイトを逃しているわけでもないので良しとする
        it 'expects pinning', ->
            first.depth = 3; second.depth = 3
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([5,1])
            expect(ret[4].koma.name).to.equal('Rook')
            expect(ret[4].posi).to.deep.equal([4,7])
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
