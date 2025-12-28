chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== king01', ->
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
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.display()
    describe '--- castling -1', ->
        it 'expects white king castling [7,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rc = b.check_move(king, [7,1])
            expect(rc).to.equal(true)
            ret = b.move_capture(king, [7,1])
            expect(ret).to.deep.equal([5,1])
            expect(king.castling).to.equal(false)
        it 'expects white king castling [3,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rc = b.check_move(king, [3,1])
            expect(rc).to.equal(true)
            ret = b.move_capture(king, [3,1])
            expect(ret).to.deep.equal([5,1])
            expect(king.castling).to.equal(false)
        it 'expects black king castling [7,8] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
            rc = b.check_move(king, [7,8])
            expect(rc).to.equal(true)
            ret = b.move_capture(king, [7,8])
            expect(ret).to.deep.equal([5,8])
            expect(king.castling).to.equal(false)
        it 'expects white king castling [3,8] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
            rc = b.check_move(king, [3,8])
            expect(rc).to.equal(true)
            ret = b.move_capture(king, [3,8])
            expect(ret).to.deep.equal([5,8])
            expect(king.castling).to.equal(false)
    afterEach ->
        b.display()

describe '=== king02', ->
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
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.display()
    describe '--- castling -1', ->
        it 'expects white king do not castling [7,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rc = b.check_move(king, [7,1])
            expect(rc).to.equal(false)
        it 'expects white king do not castling [3,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rc = b.check_move(king, [3,1])
            expect(rc).to.equal(false)
        it 'expects black king do not castling [7,8] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
            rc = b.check_move(king, [7,8])
            expect(rc).to.equal(false)
        it 'expects white king do not castling [3,8] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
            rc = b.check_move(king, [3,8])
            expect(rc).to.equal(false)
    afterEach ->
        b.display()

describe '=== king03', ->
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
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,7]))

        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.display()
    describe '--- castling -1', ->
        it 'expects white king do not castling [7,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rc = b.check_move(king, [7,1])
            expect(rc).to.equal(false)
        it 'expects white king do not castling [3,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rc = b.check_move(king, [3,1])
            expect(rc).to.equal(false)
        it 'expects black king castling [7,8] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
            rc = b.check_move(king, [7,8])
            expect(rc).to.equal(true)
            ret = b.move_capture(king, [7,8])
            expect(ret).to.deep.equal([5,8])
        it 'expects white king do not castling [3,8] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
            rc = b.check_move(king, [3,8])
            expect(rc).to.equal(false)
    afterEach ->
        b.display()

describe '=== king04', ->
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
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,4]))
        b.display()
    describe '--- castling -1', ->
        it 'expects white king do not castling [7,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rc = b.check_move(king, [7,1])
            expect(rc).to.equal(false)
        it 'expects white king do not castling [3,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rc = b.check_move(king, [3,1])
            expect(rc).to.equal(false)
    afterEach ->
        b.display()

describe '=== king05', ->
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
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,4]))
        b.display()
    describe '--- castling -1', ->
        it 'expects white king do not castling [7,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rc = b.check_move(king, [7,1])
            expect(rc).to.equal(true)
            ret = b.move_capture(king, [7,1])
            expect(ret).to.deep.equal([5,1])
            expect(king.castling).to.equal(false)
        it 'expects white king do not castling [3,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rc = b.check_move(king, [3,1])
            expect(rc).to.equal(true)
            ret = b.move_capture(king, [3,1])
            expect(ret).to.deep.equal([5,1])
            expect(king.castling).to.equal(false)
    afterEach ->
        b.display()

describe '=== king06', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,1]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,8]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.display()
    describe '--- castling -1', ->
        it 'expects cancel castling from [7,1] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rook = (v for v in b.pieces when v.posi? && v.posi[0] == 8 && v.posi[1] == 1)[0]
            f_pawn1=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "5,2")[0]
            s_pawn1=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "4,7")[0]
            f_bishop1=(v for v in b.pieces when v.name == "Bishop" && v.turn == first.turn && v.posi.toString() == "6,1")[0]
            s_bishop1=(v for v in b.pieces when v.name == "Bishop" && v.turn == second.turn && v.posi.toString() == "3,8")[0]
            f_knight1=(v for v in b.pieces when v.name == "Knight" && v.turn == first.turn && v.posi.toString() == "7,1")[0]
            s_knight1=(v for v in b.pieces when v.name == "Knight" && v.turn == second.turn && v.posi.toString() == "2,8")[0]
            if b.check_move(f_pawn1, [5,4])
                b.move_capture(f_pawn1, [5,4])
            if b.check_move(s_pawn1, [4,5])
                b.move_capture(s_pawn1, [4,5])
            if b.check_move(f_bishop1, [4,3])
                b.move_capture(f_bishop1, [4,3])
            if b.check_move(s_bishop1, [5,6])
                b.move_capture(s_bishop1, [5,6])
            if b.check_move(f_knight1, [6,3])
                b.move_capture(f_knight1, [6,3])
            if b.check_move(s_knight1, [3,6])
                b.move_capture(s_knight1, [3,6])
            rc = b.check_move(king, [7,1])
            expect(rc).to.equal(true)
            ret = b.move_capture(king, [7,1])
            expect(ret).to.deep.equal([5,1])
            expect(king.castling).to.equal(false)
            b.display()
            expect(king.castled).to.equal(Const.KING_CASTLING)
            rc = b.cancel_castling(king)
            expect(rc).to.equal(true)
            expect(king.posi).to.deep.equal([5,1])
            expect(rook.posi).to.deep.equal([8,1])
            expect(king.castled).to.equal(null)
    describe '--- castling -2', ->
        it 'expects cancel castling from [3,8] -1', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
            rook = (v for v in b.pieces when v.posi? && v.posi[0] == 1 && v.posi[1] == 8)[0]
            f_king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            s_queen=(v for v in b.pieces when v.name == "Queen" && v.turn == second.turn)[0]
            f_pawn1=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "5,2")[0]
            s_pawn1=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "4,7")[0]
            f_bishop1=(v for v in b.pieces when v.name == "Bishop" && v.turn == first.turn && v.posi.toString() == "6,1")[0]
            s_bishop1=(v for v in b.pieces when v.name == "Bishop" && v.turn == second.turn && v.posi.toString() == "3,8")[0]
            f_knight1=(v for v in b.pieces when v.name == "Knight" && v.turn == first.turn && v.posi.toString() == "7,1")[0]
            s_knight1=(v for v in b.pieces when v.name == "Knight" && v.turn == second.turn && v.posi.toString() == "2,8")[0]
            if b.check_move(f_pawn1, [5,4])
                b.move_capture(f_pawn1, [5,4])
            if b.check_move(s_pawn1, [4,5])
                b.move_capture(s_pawn1, [4,5])
            if b.check_move(f_bishop1, [4,3])
                b.move_capture(f_bishop1, [4,3])
            if b.check_move(s_bishop1, [5,6])
                b.move_capture(s_bishop1, [5,6])
            if b.check_move(f_knight1, [6,3])
                b.move_capture(f_knight1, [6,3])
            if b.check_move(s_knight1, [3,6])
                b.move_capture(s_knight1, [3,6])
            if b.check_move(f_king, [7,1])
                b.move_capture(f_king, [7,1])
            if b.check_move(s_queen, [4,7])
                b.move_capture(s_queen, [4,7])
            rc = b.check_move(king, [3,8])
            expect(rc).to.equal(true)
            ret = b.move_capture(king, [3,8])
            expect(ret).to.deep.equal([5,8])
            expect(king.castling).to.equal(false)
            b.display()
            expect(king.castled).to.equal(Const.QUEEN_CASTLING)
            rc = b.cancel_castling(king)
            expect(rc).to.equal(true)
            expect(king.posi).to.deep.equal([5,8])
            expect(rook.posi).to.deep.equal([1,8])
            expect(king.castled).to.equal(null)
    afterEach ->
        b.display()

# describe '=== king07', ->
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
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,5]))
#         b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,4]))
#         b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [6,6]))
#         b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
#         b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [1,4]))
#         b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
#         b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
#         b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
#         b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [5,2]))
#         b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [1,6]))
#         b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
#         b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
#         b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
#         b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
#         b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
#         b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
#         b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
#         b.display()
#     describe '--- castling -1', ->
#         it 'expects white king castling [7,1] -1', ->
#             king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
#             rook = (v for v in b.pieces when v.posi? && v.posi[0] == 8 && v.posi[1] == 1)[0]
#             first.pre_select = 21
#             second.pre_select = 21
#             first.depth = 1; second.depth = 1
#             ret = first.think(b, second, first.depth, Const.MAX_VALUE)
#             expect(ret[0].name).to.equal('King')
#             expect(ret[1]).to.deep.equal([7,1])
#     afterEach ->
#         console.log(ret)
#         if ret[0]?
#             if b.check_move(ret[0], ret[1])
#                 b.move_capture(ret[0], ret[1])
#                 ret[0].status = ret[3]
#         else
#             console.log("AI resigned.")
#         b.display()

# describe '=== king08', ->
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
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,5]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,4]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
#         b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,1]))
#         b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,7]))
#         b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
#         b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
#         b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
#         b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
#         b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
#         b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,3]))
#         b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [3,6]))
#         b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
#         b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
#         b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
#         b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
#         b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
#         b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
#         b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
#         b.display()
#     describe '--- castling -1', ->
#         it 'expects white king castling [7,1] -1', ->
#             king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
#             rook = (v for v in b.pieces when v.posi? && v.posi[0] == 8 && v.posi[1] == 1)[0]
#             first.pre_select = 21
#             second.pre_select = 21
#             first.depth = 1; second.depth = 1
#             ret = first.think(b, second, first.depth, Const.MAX_VALUE)
#             expect(ret[0].name).to.equal('King')
#             expect(ret[1]).to.deep.equal([7,1])
#     afterEach ->
#         console.log(ret)
#         if ret[0]?
#             if b.check_move(ret[0], ret[1])
#                 b.move_capture(ret[0], ret[1])
#                 ret[0].status = ret[3]
#         else
#             console.log("AI resigned.")
#         b.display()

# describe '=== king09', ->
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
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,5]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,4]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,6]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
#         b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
#         b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
#         b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,1]))
#         b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [5,7]))
#         b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
#         b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
#         b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [7,4]))
#         b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
#         b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [3,3]))
#         b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,3]))
#         b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [3,6]))
#         b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
#         b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
#         b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,1]))
#         b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
#         b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
#         b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
#         b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
#         b.display()
#     describe '--- castling -1', ->
#         it 'expects black king castling [3,8] -1', ->
#             king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
#             rook = (v for v in b.pieces when v.posi? && v.posi[0] == 8 && v.posi[1] == 1)[0]
#             first.pre_select = 21
#             second.pre_select = 21
#             first.depth = 1; second.depth = 1
#             ret = second.think(b, first, second.depth, Const.MIN_VALUE)
#             expect(ret[0].name).to.equal('King')
#             expect(ret[1]).to.deep.equal([3,8])
#     afterEach ->
#         console.log(ret)
#         if ret[0]?
#             if b.check_move(ret[0], ret[1])
#                 b.move_capture(ret[0], ret[1])
#                 ret[0].status = ret[3]
#         else
#             console.log("AI resigned.")
#         b.display()

describe '=== king10', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.display()
    # describe '--- castling -1', ->
    describe '--- not castling -1', ->        
        it 'expects white king castling [7,1] when depth == 2 ', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            rook = (v for v in b.pieces when v.posi? && v.posi[0] == 8 && v.posi[1] == 1)[0]
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([3,7])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== king11', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.MOTIGOMA))
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
    describe '--- castling -1', ->
        it 'expects black king can not castling -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).not.to.equal('King')
            expect(ret[1]).not.to.deep.equal([3,8])
            console.log(ret)
            if ret[0]?
                if b.check_move(ret[0], ret[1])
                    b.move_capture(ret[0], ret[1])
                    ret[0].status = ret[3]
            king=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
            # console.log("===========================================")
            rc = b.check_move(king, [3,8])
            expect(rc).to.equal(false)
    describe '--- castling -2', ->
        it 'expects black king can not castling -2', ->
            king=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
            rc = b.check_move(king, [3,8])
            expect(rc).to.equal(false)
    # describe '--- castling -3', ->
    #     it 'expects black king can not castling -3', ->
    #         king=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
    #         ret = b.move_capture(king, [3,8])
    #         console.log(ret)
    #         expect(ret).to.deep.equal([5,8])
    afterEach ->
        b.display()
