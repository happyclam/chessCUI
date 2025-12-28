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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Queen escape -1', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            # ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Bishop')
            expect(ret[1]).to.deep.equal([6,7])
            # expect(ret[2]).to.equal(29)
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== battle02', ->
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
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Queen escape -2', ->
            f_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "5,2")[0]
            if b.check_move(f_piece, [5,3])
                b.move_capture(f_piece, [5,3])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "4,7")[0]
            if b.check_move(s_piece, [4,6])
                b.move_capture(s_piece, [4,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Queen" && v.turn == first.turn)[0]
            if b.check_move(f_piece, [6,3])
                b.move_capture(f_piece, [6,3])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Knight" && v.turn == second.turn && v.posi.toString() == "2,8")[0]
            if b.check_move(s_piece, [4,7])
                b.move_capture(s_piece, [4,7])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Knight" && v.turn == first.turn && v.posi.toString() == "2,1")[0]
            if b.check_move(f_piece, [3,3])
                b.move_capture(f_piece, [3,3])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Knight" && v.turn == second.turn && v.posi.toString() == "7,8")[0]
            if b.check_move(s_piece, [6,6])
                b.move_capture(s_piece, [6,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Queen" && v.turn == first.turn)[0]
            if b.check_move(f_piece, [6,4])
                b.move_capture(f_piece, [6,4])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "3,7")[0]
            if b.check_move(s_piece, [3,6])
                b.move_capture(s_piece, [3,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "2,2")[0]
            if b.check_move(f_piece, [2,4])
                b.move_capture(f_piece, [2,4])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Queen" && v.turn == second.turn)[0]
            if b.check_move(s_piece, [2,6])
                b.move_capture(s_piece, [2,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Knight" && v.turn == first.turn && v.posi.toString() == "7,1")[0]
            if b.check_move(f_piece, [6,3])
                b.move_capture(f_piece, [6,3])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "7,7")[0]
            if b.check_move(s_piece, [7,6])
                b.move_capture(s_piece, [7,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Bishop" && v.turn == first.turn && v.posi.toString() == "3,1")[0]
            if b.check_move(f_piece, [2,2])
                b.move_capture(f_piece, [2,2])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Bishop" && v.turn == second.turn && v.posi.toString() == "6,8")[0]
            if b.check_move(s_piece, [7,7])
                b.move_capture(s_piece, [7,7])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            if b.check_move(f_piece, [3,1])
                b.move_capture(f_piece, [3,1])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Queen" && v.turn == second.turn)[0]
            if b.check_move(s_piece, [3,7])
                b.move_capture(s_piece, [3,7])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Bishop" && v.turn == first.turn && v.posi.toString() == "6,1")[0]
            if b.check_move(f_piece, [3,4])
                b.move_capture(f_piece, [3,4])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "5,7")[0]
            if b.check_move(s_piece, [5,6])
                b.move_capture(s_piece, [5,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Knight" && v.turn == first.turn && v.posi.toString() == "3,3")[0]
            if b.check_move(f_piece, [1,4])
                b.move_capture(f_piece, [1,4])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "5,6")[0]
            if b.check_move(s_piece, [5,5])
                b.move_capture(s_piece, [5,5])
            # b.display()

            first.pre_select = 10
            second.pre_select = 10
            first.depth = 4; second.depth = 4
            normal_weight()
            # ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            # expect(ret[0].name).to.equal('Bishop')
            # expect(ret[1]).to.deep.equal([6,7])
            # expect(ret[2]).to.equal(29)
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

describe '=== battle03', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        # b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,5]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [3,7]))
        # b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,2]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Queen escape -1', ->
            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            normal_weight()
            # ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([3,4])
            # expect(ret[2]).to.equal(21)
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== battle04', ->
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
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Queen escape -2', ->
            normal_weight()
            f_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "5,2")[0]
            if b.check_move(f_piece, [5,3])
                b.move_capture(f_piece, [5,3])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "4,7")[0]
            if b.check_move(s_piece, [4,6])
                b.move_capture(s_piece, [4,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Queen" && v.turn == first.turn)[0]
            if b.check_move(f_piece, [6,3])
                b.move_capture(f_piece, [6,3])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Knight" && v.turn == second.turn && v.posi.toString() == "2,8")[0]
            if b.check_move(s_piece, [4,7])
                b.move_capture(s_piece, [4,7])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Knight" && v.turn == first.turn && v.posi.toString() == "2,1")[0]
            if b.check_move(f_piece, [3,3])
                b.move_capture(f_piece, [3,3])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Knight" && v.turn == second.turn && v.posi.toString() == "7,8")[0]
            if b.check_move(s_piece, [6,6])
                b.move_capture(s_piece, [6,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Queen" && v.turn == first.turn)[0]
            if b.check_move(f_piece, [6,4])
                b.move_capture(f_piece, [6,4])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "3,7")[0]
            if b.check_move(s_piece, [3,6])
                b.move_capture(s_piece, [3,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == first.turn && v.posi.toString() == "2,2")[0]
            if b.check_move(f_piece, [2,4])
                b.move_capture(f_piece, [2,4])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Queen" && v.turn == second.turn)[0]
            if b.check_move(s_piece, [2,6])
                b.move_capture(s_piece, [2,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Knight" && v.turn == first.turn && v.posi.toString() == "7,1")[0]
            if b.check_move(f_piece, [6,3])
                b.move_capture(f_piece, [6,3])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "7,7")[0]
            if b.check_move(s_piece, [7,6])
                b.move_capture(s_piece, [7,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Bishop" && v.turn == first.turn && v.posi.toString() == "3,1")[0]
            if b.check_move(f_piece, [2,2])
                b.move_capture(f_piece, [2,2])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Bishop" && v.turn == second.turn && v.posi.toString() == "6,8")[0]
            if b.check_move(s_piece, [7,7])
                b.move_capture(s_piece, [7,7])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "King" && v.turn == first.turn)[0]
            if b.check_move(f_piece, [3,1])
                b.move_capture(f_piece, [3,1])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Queen" && v.turn == second.turn)[0]
            if b.check_move(s_piece, [3,7])
                b.move_capture(s_piece, [3,7])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Bishop" && v.turn == first.turn && v.posi.toString() == "6,1")[0]
            if b.check_move(f_piece, [3,4])
                b.move_capture(f_piece, [3,4])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "5,7")[0]
            if b.check_move(s_piece, [5,6])
                b.move_capture(s_piece, [5,6])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Knight" && v.turn == first.turn && v.posi.toString() == "3,3")[0]
            if b.check_move(f_piece, [1,4])
                b.move_capture(f_piece, [1,4])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "Pawn" && v.turn == second.turn && v.posi.toString() == "5,6")[0]
            if b.check_move(s_piece, [5,5])
                b.move_capture(s_piece, [5,5])
            # b.display()
            f_piece=(v for v in b.pieces when v.name == "Bishop" && v.turn == first.turn && v.posi.toString() == "3,4")[0]
            if b.check_move(f_piece, [6,7])
                b.move_capture(f_piece, [6,7])
            # b.display()
            s_piece=(v for v in b.pieces when v.name == "King" && v.turn == second.turn)[0]
            if b.check_move(s_piece, [6,7])
                b.move_capture(s_piece, [6,7])
            # b.display()

            first.pre_select = 20
            second.pre_select = 20
            first.depth = 3; second.depth = 3
            # ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([3,4])
            # expect(ret[2]).to.equal(21)
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
