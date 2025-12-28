chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== pawn01', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.display()
    describe '--- 基本動作 -1', ->
        it 'expects white pawn 1 move -1', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            rc = b.check_move(piece, [5,3])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [5,3])
            expect(ret).to.deep.equal([5,2])
        it 'expects white pawn 2 move -2', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            rc = b.check_move(piece, [5,4])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [5,4])
            expect(ret).to.deep.equal([5,2])
        it 'expects white pawn do not move [4,3]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [4,3])
            expect(rc).to.equal(false)
        it 'expects white pawn do not move [6,3]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [6,3])
            expect(rc).to.equal(false)
        it 'expects white pawn do not move [6,5]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[1]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [6,5])
            expect(rc).to.equal(false)


        it 'expects black pawn 1 move -1', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            rc = b.check_move(piece, [5,6])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [5,6])
            expect(ret).to.deep.equal([5,7])
        it 'expects black pawn 2 move -1', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            rc = b.check_move(piece, [5,5])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [5,5])
            expect(ret).to.deep.equal([5,7])
        it 'expects black pawn do not move [4,6]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [4,6])
            expect(rc).to.equal(false)
        it 'expects black pawn do not move [6,6]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [6,6])
            expect(rc).to.equal(false)
        it 'expects black pawn do not move [6,4]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[1]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [6,4])
            expect(rc).to.equal(false)
    afterEach ->
        b.display()

describe '=== pawn02', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.display()
    describe '--- 駒を取る -1', ->
        it 'expects white pawn capture black [6,5] -1', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            rc = b.check_move(piece, [6,5])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [6,5])
            expect(ret).to.deep.equal([5,4])
        it 'expects white pawn capture black [5,5] -2', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[1]
            rc = b.check_move(piece, [5,5])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [5,5])
            expect(ret).to.deep.equal([6,4])
        it 'expects white pawn do not move [5,5]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [5,5])
            expect(rc).to.equal(false)
        it 'expects white pawn do not move [4,5]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [4,5])
            expect(rc).to.equal(false)
        it 'expects white pawn do not move [5,6]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [5,6])
            expect(rc).to.equal(false)

        it 'expects black pawn capture white [6,4] -1', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            rc = b.check_move(piece, [6,4])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [6,4])
            expect(ret).to.deep.equal([5,5])
        it 'expects black pawn capture white [5,4] -2', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[1]
            rc = b.check_move(piece, [5,4])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [5,4])
            expect(ret).to.deep.equal([6,5])
        it 'expects black pawn do not move [5,4]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [5,4])
            expect(rc).to.equal(false)
        it 'expects black pawn do not move [4,4]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [4,4])
            expect(rc).to.equal(false)
        it 'expects black pawn do not move [5,3]', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            console.log("original posi = #{piece.posi}")
            rc = b.check_move(piece, [5,3])
            expect(rc).to.equal(false)
    afterEach ->
        b.display()

describe '=== pawn03', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.display()
    describe '--- アンパッサン -1', ->
        it 'expects white pawn capture black [6,5] -1', ->
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[1]
            rc = b.check_move(piece, [2,5])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [2,5])
            expect(piece.enpassant).to.equal(true)
    describe '--- アンパッサン -2', ->
        it 'expects white pawn capture black [2,5] -1', ->
            captured = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[1]
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[1]
            rc = b.check_move(piece, [2,5])
            ret = b.move_capture(piece, [2,5])
            b.display()
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[1]
            rc = b.check_move(piece, [2,6])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [2,6])
            expect(ret).to.deep.equal([3,5])
            expect(captured.enpassant).to.equal(false)
            expect(captured.turn).to.equal(Const.FIRST)
    describe '--- アンパッサン -3', ->
        it 'expects enpassant flag maintain after think -1', ->
            captured = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[1]
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[1]
            rc = b.check_move(piece, [2,5])
            ret = b.move_capture(piece, [2,5])
            b.display()
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            enpassant = (v for v in b.pieces when v.posi? && v.name == 'Pawn' && v.status == Const.Status.OMOTE && v.enpassant == true)[0]
            if enpassant?
                org_enpassant = enpassant.enpassant
                org_posi = enpassant.posi
                org_status = enpassant.status
                org_turn = enpassant.turn
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            enpassant.enpassant = org_enpassant if org_enpassant?
            enpassant.posi = org_posi if org_posi?
            enpassant.status = org_status if org_status?
            enpassant.turn = org_turn if org_turn?
            expect(captured.enpassant).to.equal(true)
            expect(captured.turn).to.equal(Const.SECOND)
            expect(captured.posi).to.deep.equal([2,5])
            expect(captured.status).to.equal(Const.Status.OMOTE)
    describe '--- アンパッサン -4', ->
        it 'expects do not move enpassant against direction -1', ->
            captured = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[1]
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[1]
            rc = b.check_move(piece, [2,5])
            ret = b.move_capture(piece, [2,5])
            b.display()
            piece = (v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[1]
            rc = b.check_move(piece, [4,6])
            expect(rc).to.equal(false)
    afterEach ->
        b.display()

describe '=== pawn04', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.display()
    describe '--- Promotion -1', ->
        it 'expects white pawn promote queen [2,8] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            rc = b.check_promotion(piece,[2,8])
            expect(rc).to.equal(true)
            rc = b.check_move(piece, [2,8])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [2,8])
            expect(ret).to.deep.equal([2,7])
            expect(piece.status).to.equal(Const.Status.QUEEN)
    describe '--- Promotion -2', ->
        it 'expects black pawn promote queen [3,1] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            rc = b.check_promotion(piece,[3,1])
            expect(rc).to.equal(true)
            rc = b.check_move(piece, [3,1])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [3,1])
            expect(ret).to.deep.equal([3,2])
            expect(piece.status).to.equal(Const.Status.QUEEN)
    describe '--- Promotion -3', ->
        it 'expects black pawn promote queen [2,1] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            rc = b.check_promotion(piece,[2,1])
            expect(rc).to.equal(true)
            rc = b.check_move(piece, [2,1])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [2,1])
            expect(ret).to.deep.equal([3,2])
            expect(piece.status).to.equal(Const.Status.QUEEN)
    describe '--- Promotion -4', ->
        it 'expects black pawn promote queen [4,1] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn)[0]
            rc = b.check_promotion(piece,[4,1])
            expect(rc).to.equal(true)
            rc = b.check_move(piece, [4,1])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [4,1])
            expect(ret).to.deep.equal([3,2])
            expect(piece.status).to.equal(Const.Status.QUEEN)
    afterEach ->
        b.display()

describe '=== pawn05', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.display()
    describe '--- Promotion -1', ->
        it 'expects white pawn do not move [2,8] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            rc = b.check_move(piece, [2,8])
            expect(rc).to.equal(false)
    describe '--- Promotion -1', ->
        it 'expects white pawn do not move [4,8] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            rc = b.check_move(piece, [4,8])
            expect(rc).to.equal(false)
    describe '--- Promotion -1', ->
        it 'expects white pawn promote queen [3,8] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            # kind = piece.name
            # expect(kind).to.equal("Pawn")
            console.log(piece)
            rc = b.check_promotion(piece,[3,8])
            expect(rc).to.equal(true)
            rc = b.check_move(piece, [3,8])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [3,8])
            expect(ret).to.deep.equal([3,7])
            expect(piece.status).to.equal(Const.Status.QUEEN)
    afterEach ->
        b.display()

describe '=== pawn06', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.display()
    describe '--- Promotion -1', ->
        it 'expects white pawn do not move [3,8] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            rc = b.check_move(piece, [3,8])
            expect(rc).to.equal(false)
    describe '--- Promotion -1', ->
        it 'expects white pawn move [3,7] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn)[0]
            rc = b.check_move(piece, [3,7])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [3,7])
            expect(ret).to.deep.equal([3,6])
    afterEach ->
        b.display()

describe '=== pawn07', ->
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
    describe '--- アンパッサン -1', ->
        it 'expects white pawn do not move [7,3] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "8,2")[0]
            f_pawn1=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "5,2")[0]
            s_pawn1=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "7,7")[0]
            if b.check_move(f_pawn1, [5,4])
                b.move_capture(f_pawn1, [5,4])
            if b.check_move(s_pawn1, [7,5])
                b.move_capture(s_pawn1, [7,5])
            b.display()
            rc = b.check_move(piece, [7,3])
            expect(rc).to.equal(false)
    describe '--- アンパッサン -2', ->
        it 'expects white pawn do not affect other pieces -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "4,2")[0]
            s_pawn1=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "3,7")[0]
            s_pawn2=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "4,7")[0]
            if b.check_move(piece, [4,4])
                b.move_capture(piece, [4,4])
            if b.check_move(s_pawn1, [3,5])
                b.move_capture(s_pawn1, [3,5])
            if b.check_move(piece, [3,5])
                b.move_capture(piece, [3,5])
            if b.check_move(s_pawn2, [4,5])
                b.move_capture(s_pawn2, [4,5])
            b.display()
            rc = b.check_move(piece, [3,6])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [3,6])
            expect(ret).to.deep.equal([3,5])
            expect(s_pawn2.turn).to.equal(Const.SECOND)
            expect(s_pawn2.status).to.equal(Const.Status.OMOTE)
            expect(s_pawn2.posi).to.deep.equal([4,5])
            expect(s_pawn2.enpassant).to.equal(false)
    describe '--- アンパッサン -3', ->
        it 'expects white pawn enpassant [] -1', ->
            piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "4,2")[0]
            s_pawn1=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "3,7")[0]
            s_pawn2=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "4,7")[0]
            if b.check_move(piece, [4,4])
                b.move_capture(piece, [4,4])
            if b.check_move(s_pawn1, [3,5])
                b.move_capture(s_pawn1, [3,5])
            if b.check_move(piece, [3,5])
                b.move_capture(piece, [3,5])
            if b.check_move(s_pawn2, [4,5])
                b.move_capture(s_pawn2, [4,5])
            b.display()
            rc = b.check_move(piece, [4,6])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece, [4,6])
            expect(ret).to.deep.equal([3,5])
            expect(s_pawn2.turn).to.equal(Const.FIRST)
            expect(s_pawn2.status).to.equal(Const.Status.MOTIGOMA)
            expect(s_pawn2.posi).to.deep.equal([])
            expect(s_pawn2.enpassant).to.equal(false)
    afterEach ->
        b.display()

describe '=== pawn08', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.QUEEN, [7,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.display()
    describe '--- problem -1', ->
        it 'expects do not misunderstand stalemate -1', ->
            ret = b.check_tumi(first.turn)
            console.log(ret)
            expect(ret[0]).to.equal(false)
            expect(ret[1]).to.not.equal(Const.STALEMATE)
    afterEach ->
        b.display()

describe '=== pawn09', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.QUEEN, [7,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.display()
    describe '--- problem -1', ->
        it 'expects do not misunderstand stalemate -1', ->
            ret = b.check_tumi(first.turn)
            console.log(ret)
            expect(ret[0]).to.equal(false)
            expect(ret[1]).to.not.equal(Const.STALEMATE)
    afterEach ->
        b.display()

describe '=== pawn10', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [2,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.MOTIGOMA))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.display()
    describe '--- problem -1', ->
        it 'expects enpassant flag is clear -1', ->
            piece1=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "2,2")[0]
            piece2=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "3,6")[0]
            rc = b.check_move(piece1, [2,4])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece1, [2,4])
            expect(piece1.enpassant).to.equal(true)
            b.display()
            rc = b.check_move(piece2, [2,5])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece2, [2,5])
            expect(ret).to.deep.equal([3,6])
            expect(piece1.enpassant).to.equal(false)
    describe '--- problem -2', ->
        it 'expects enpassant work -2', ->
            piece1=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "2,2")[0]
            piece2=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "1,4")[0]
            rc = b.check_move(piece1, [2,4])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece1, [2,4])
            expect(piece1.enpassant).to.equal(true)
            b.display()
            rc = b.check_move(piece2, [2,3])
            expect(rc).to.equal(true)
            ret = b.move_capture(piece2, [2,3])
            expect(ret).to.deep.equal([1,4])
            expect(piece1.status).to.equal(Const.Status.MOTIGOMA)
    afterEach ->
        b.display()
