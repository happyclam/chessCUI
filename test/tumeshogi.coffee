chai = require 'chai'
expect = chai.expect
chai.should()
Const = require('../const.coffee')
Piece = require('../piece.coffee')
Board = require('../board.coffee')
Player = require('../player.coffee')

describe '=== tume01', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,1]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,4]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,3]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [6,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white check [8,5] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            # ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Knight')
            expect(ret[1]).to.deep.equal([8,5])
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

describe '=== tume02', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [4,3]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [6,3]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [7,8]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white move Rook [8,6] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            # ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([8,6])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== tume03', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [2,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Rook move [1,6] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            # ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([1,6])
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

describe '=== tume04', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [2,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Rook move [1,6] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Rook')
            expect(ret[1]).to.deep.equal([1,6])
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

describe '=== tume05', ->
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
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white pawn promote Bishop [3,8] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([3,8])
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

describe '=== tume06', ->
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
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white pawn promote Bishop [3,8] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            # ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[3]).to.equal(2)
            expect(ret[1]).to.deep.equal([3,8])
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

describe '=== tume07', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,7]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white pawn promote Queen [3,8] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([3,8])
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

describe '=== tume08', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.QUEEN, [3,8]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [8,1]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white pawn move Bishop [2,7] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([2,7])
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

describe '=== tume09', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,5]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [4,7]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [2,7]))
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

describe '=== tume10', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,4]))
        b.pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [1,4]))
        b.pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,1]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white pawn promote Bishop [3,8] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 3; second.depth = 3
            normal_weight()
            # ret = first.prepare(b, second, first.depth, Const.MAX_VALUE)
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[3]).to.equal(2)
            expect(ret[1]).to.deep.equal([3,8])
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

describe '=== tume11', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [2,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects black Pawn move [1,6] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 0; second.depth = 0
            normal_weight()
            ret = second.think(b, first, second.depth, Const.MIN_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([1,6])
    afterEach ->
        console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== tume12', ->
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
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,8]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,8]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,6]))
        b.pieces.push(new Piece.Rook(Const.SECOND, Const.Status.MOTIGOMA, []))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,6]))
        b.pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [2,8]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects white Pawn move [2,7] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.equal('Pawn')
            expect(ret[1]).to.deep.equal([2,7])
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

describe '=== tume13', ->
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
        it 'expects Bishop do not move [6,6] -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 1; second.depth = 1
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.not.equal('Bishop')
            # expect(ret[2]).to.not.be.above(9999)
    afterEach ->
        # console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== tume14', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects Pawn do not promote Queen -1', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            expect(ret[0].name).to.not.equal('Pawn')
            expect(ret[0].status).to.not.equal(Const.Status.QUEEN)
            # expect(ret[2]).to.not.be.above(9999)
    afterEach ->
        # console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== tume15', ->
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
        # b.pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,4]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [6,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,6]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects Pawn do not promote Queen -2', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            console.log(ret)
            expect(ret[0].name).to.not.equal('Pawn')
            expect(ret[0].status).to.not.equal(Const.Status.QUEEN)
            # expect(ret[2]).to.not.be.above(9999)
    afterEach ->
        # console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()

describe '=== tume16', ->
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
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,7]))
        b.pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,3]))
        b.pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [5,7]))
        b.pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,1]))
        b.pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,7]))
        b.display()
    normal_weight = ->
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        return
    describe '--- problem -1', ->
        it 'expects Pawn do not promote Queen -2', ->
            first.pre_select = 21
            second.pre_select = 21
            first.depth = 2; second.depth = 2
            normal_weight()
            ret = first.think(b, second, first.depth, Const.MAX_VALUE)
            console.log(ret)
            expect(ret[0].name).to.not.equal('Pawn')
            expect(ret[0].status).to.not.equal(Const.Status.QUEEN)
            # expect(ret[2]).to.not.be.above(9999)
    afterEach ->
        # console.log(ret)
        if ret[0]?
            if b.check_move(ret[0], ret[1])
                b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
        else
            console.log("AI resigned.")
        b.display()
