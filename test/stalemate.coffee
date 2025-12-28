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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,2]))
        # b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.display()
    describe '--- problem -1', ->
        it 'expects do not misunderstand stalemate -1', ->
            rc = b.check_strict(first.turn)
            console.log(rc)
            expect(rc).to.equal(false)
    describe '--- problem -2', ->
        it 'expects judge stalemate -1', ->
            ret = b.check_tumi(second.turn)
            console.log(ret)
            expect(ret[0]).to.equal(true)
            expect(ret[1]).to.equal(Const.STALEMATE)
    afterEach ->
        b.display()

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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects do not misunderstand stalemate -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            # ret = second.prepare(b, first, second.depth, Const.MIN_VALUE)
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('King')
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects not misunderstand steelmate is win, move Bishop [3,7] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.not.equal('Bishop')
            # expect(ret[2]).to.not.be.above(9999)
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects move Bishop [3,7] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Bishop')
            expect(ret[1]).to.deep.equal([6,6])
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects move Bishop [3,7] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Bishop')
            expect(ret[1]).to.deep.equal([6,6])
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects do not misunderstand stalemate -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([4,8])
            # expect(ret[2]).to.be.above(9999)
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== stalemate07', ->
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
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,2]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [4,5]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [3,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects do not misunderstand stalemate -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([4,8])
            # expect(ret[2]).to.be.above(9999)
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== stalemate08', ->
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
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [4,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects Queen move [6,4] & stalemate -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Queen')
            expect(ret[1]).to.deep.equal([6,4])
            # expect(ret[2]).to.be.above(9999)
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== stalemate09', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects Pawn move [5,8] & promote Bishop & stalemate -2', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 4; second.depth = 4
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([5,8])
            # expect(ret[2]).to.be.above(9999)
            expect(ret[3]).to.equal(2)
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== stalemate10', ->
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
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,6]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects Knight move [3,5] & stalemate -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Knight')
            expect(ret[1]).to.deep.equal([3,5])
            # expect(ret[2]).to.be.above(9999)
            # expect(ret[3]).to.equal(2)
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== stalemate11', ->
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
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,2]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,5]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,8]))
        # b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,3]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects Pawn move [1,8] & promote Rook & stalemate -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([1,8])
            # expect(ret[2]).to.be.above(9999)
            expect(ret[3]).to.equal(4)
    afterEach ->
        console.log(ret) if ret.length > 0
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
