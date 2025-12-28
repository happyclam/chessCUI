Const = require('./const')

@getClass = (classname) ->
    return switch classname
        when 'King' then gKing
        when 'Queen' then gQueen
        when 'Bishop' then gBishop
        when 'Knight' then gKnight
        when 'Rook' then gRook
        when 'Pawn' then gPawn
        else gPiece

class Course
    constructor: (series = 0, xd = 0, yd = 0) ->
        @series = series
        @xd = xd
        @yd = yd

class Piece
    constructor: (@turn, @status, @posi = null) ->
        @posi = if @posi? then @posi.concat() else []
        @preposi = []
        @id = uniqueId.call @
        @coefficient = 0.0
        @gravity = 1.0
    setTurn: (turn) ->
        if turn != @turn
            @turn = turn
    uniqueId = (length = 8) ->
        id = ""
        id += Math.random().toString(36).substr(2) while id.length < length
        return id.substr 0, length

class King extends Piece
    _direction = {}
    _direction[Const.Status.OMOTE] = {}
    # _direction[Const.Status.URA] = {}
    _direction[Const.Status.MOTIGOMA] = {}
    _direction[Const.Status.OMOTE][Const.SECOND] = [new Course(0, 0, -1), new Course(0, -1, -1), new Course(0, -1, 0), new Course(0, -1, 1), new Course(0, 0, 1), new Course(0, 1, 1), new Course(0, 1, 0), new Course(0, 1, -1)]
    _direction[Const.Status.OMOTE][Const.FIRST] = [new Course(0, 0, 1), new Course(0, 1, 1), new Course(0, 1, 0), new Course(0, 1, -1), new Course(0, 0, -1), new Course(0, -1, -1), new Course(0, -1, 0), new Course(0, -1, 1)]
    _direction[Const.Status.MOTIGOMA][Const.FIRST] = []
    _direction[Const.Status.MOTIGOMA][Const.SECOND] = []
    # @potential = [8, 8]
    @weight = 9999
    @getD: (turn, status) ->
        return _direction[status][turn]

    constructor: (turn, status, posi) ->
        super(turn, status, posi)
        @castling = true
        @castled = null
        @name = "King"
    # kind: ->
    #     @constructor.name

    koma: ->
        return if @turn == Const.FIRST then 'K' else 'k'

    omomi: ->
        ret = switch @status
            when Const.Status.OMOTE then King.weight
            when Const.Status.MOTIGOMA then King.weight
            else
                console.log("Error: King.omomi")
        return ret

    caption: ->
        switch @status
            when Const.Status.OMOTE
                if @turn == Const.FIRST then String.fromCharCode(0x2654) else String.fromCharCode(0x265a)
            when Const.Status.MOTIGOMA
                if @turn == Const.FIRST then String.fromCharCode(0x265a) else String.fromCharCode(0x2654)
            else
                console.log("King.caption: Error")

class Queen extends Piece
    _direction = {}
    _direction[Const.Status.OMOTE] = {}
    # _direction[Const.Status.URA] = {}
    _direction[Const.Status.MOTIGOMA] = {}
    _direction[Const.Status.OMOTE][Const.SECOND] = [new Course(9, -1, -1), new Course(9, -1, 1), new Course(9, 1, 1), new Course(9, 1, -1), new Course(9, 0, -1), new Course(9, 0, 1), new Course(9, -1, 0), new Course(9, 1, 0)]
    _direction[Const.Status.OMOTE][Const.FIRST] = [new Course(9, 1, 1), new Course(9, 1, -1), new Course(9, -1, -1), new Course(9, -1, 1), new Course(9, 0, -1), new Course(9, 0, 1), new Course(9, -1, 0), new Course(9, 1, 0)]
    _direction[Const.Status.MOTIGOMA][Const.FIRST] = []
    _direction[Const.Status.MOTIGOMA][Const.SECOND] = []
    @potential = [27, 27, 27, 27, 27]
    @weight = 90
    @getD: (turn, status) ->
        return _direction[status][turn]

    constructor: (turn, status, posi) ->
        super(turn, status, posi)
        @gravity = 1.0
        @name = "Queen"
    # kind: ->
    #     @constructor.name

    koma: ->
        return if @turn == Const.FIRST then 'Q' else 'q'

    omomi: ->
        ret = switch @status
            when Const.Status.OMOTE
                Queen.weight * (@gravity + @coefficient / Queen.potential[@status])
            when Const.Status.MOTIGOMA
                0
            else
                console.log("Error: Queen.omomi")
        return parseInt(ret, 10)

    caption: ->
        switch @status
            when Const.Status.OMOTE
                if @turn == Const.FIRST then String.fromCharCode(0x2655) else String.fromCharCode(0x265b)
            when Const.Status.MOTIGOMA
                if @turn == Const.FIRST then String.fromCharCode(0x265b) else String.fromCharCode(0x2655)
            else
                console.log("Queen.caption: Error")

class Bishop extends Piece
    _direction = {}
    _direction[Const.Status.OMOTE] = {}
    # _direction[Const.Status.URA] = {}
    _direction[Const.Status.MOTIGOMA] = {}
    _direction[Const.Status.OMOTE][Const.SECOND] = [new Course(9, -1, -1), new Course(9, -1, 1), new Course(9, 1, 1), new Course(9, 1, -1)]
    _direction[Const.Status.OMOTE][Const.FIRST] = [new Course(9, 1, 1), new Course(9, 1, -1), new Course(9, -1, -1), new Course(9, -1, 1)]
    _direction[Const.Status.MOTIGOMA][Const.FIRST] = []
    _direction[Const.Status.MOTIGOMA][Const.SECOND] = []
    @potential = [13, 13, 13, 13, 13]
    @weight = 30
    @getD: (turn, status) ->
        return _direction[status][turn]

    constructor: (turn, status, posi) ->
        super(turn, status, posi)
        @gravity = 1.0
        @name = "Bishop"
    # kind: ->
    #     @constructor.name

    koma: ->
        return if @turn == Const.FIRST then 'B' else 'b'

    omomi: ->
        ret = switch @status
            when Const.Status.OMOTE
                Bishop.weight * (@gravity + @coefficient / Bishop.potential[@status])
            when Const.Status.MOTIGOMA
                0
            else
                console.log("Error: Bishop.omomi")
        return parseInt(ret, 10)

    caption: ->
        switch @status
            when Const.Status.OMOTE
                if @turn == Const.FIRST then String.fromCharCode(0x2657) else String.fromCharCode(0x265d)
            when Const.Status.MOTIGOMA
                if @turn == Const.FIRST then String.fromCharCode(0x265d) else String.fromCharCode(0x2657)
            else
                console.log("Bishop.caption: Error")

class Knight extends Piece
    _direction = {}
    _direction[Const.Status.OMOTE] = {}
    # _direction[Const.Status.URA] = {}
    _direction[Const.Status.MOTIGOMA] = {}
    _direction[Const.Status.OMOTE][Const.SECOND] = [new Course(0, 1, -2), new Course(0, -1, -2), new Course(0, 2, -1), new Course(0, -2, -1), new Course(0, 2, 1), new Course(0, -2, 1), new Course(0, 1, 2), new Course(0, -1, 2)]
    _direction[Const.Status.OMOTE][Const.FIRST] = [new Course(0, -1, 2), new Course(0, 1, 2), new Course(0, -2, 1), new Course(0, 2, 1), new Course(0, -2, -1), new Course(0, 2, -1), new Course(0, -1, -2), new Course(0, 1, -2)]
    _direction[Const.Status.MOTIGOMA][Const.FIRST] = []
    _direction[Const.Status.MOTIGOMA][Const.SECOND] = []
    @potential = [8, 8, 8, 8, 8]
    @weight = 30
    @getD: (turn, status) ->
        return _direction[status][turn]

    constructor: (turn, status, posi) ->
        super(turn, status, posi)
        @gravity = 1.0
        @name = "Knight"
    # kind: ->
    #     @constructor.name

    koma: ->
        return if @turn == Const.FIRST then 'N' else 'n'

    omomi: ->
        ret = switch @status
            when Const.Status.OMOTE
                Knight.weight * (@gravity + @coefficient / Knight.potential[@status])
            when Const.Status.MOTIGOMA
                0
            else
                console.log("Error: Knight.omomi")
        return parseInt(ret, 10)

    caption: ->
        switch @status
            when Const.Status.OMOTE
                if @turn == Const.FIRST then String.fromCharCode(0x2658) else String.fromCharCode(0x265e)
            when Const.Status.MOTIGOMA
                if @turn == Const.FIRST then String.fromCharCode(0x265e) else String.fromCharCode(0x2658)
            else
                console.log("Knight.caption: Error")

class Rook extends Piece
    _direction = {}
    _direction[Const.Status.OMOTE] = {}
    # _direction[Const.Status.URA] = {}
    _direction[Const.Status.MOTIGOMA] = {}
    _direction[Const.Status.OMOTE][Const.SECOND] = [new Course(9, 0, -1), new Course(9, -1, 0), new Course(9, 0, 1), new Course(9, 1, 0)]
    _direction[Const.Status.OMOTE][Const.FIRST] = [new Course(9, 0, 1), new Course(9, 1, 0), new Course(9, 0, -1), new Course(9, -1, 0)]
    _direction[Const.Status.MOTIGOMA][Const.FIRST] = []
    _direction[Const.Status.MOTIGOMA][Const.SECOND] = []
    @potential = [14, 14, 14, 14, 14]
    @weight = 50
    @getD: (turn, status) ->
        return _direction[status][turn]

    constructor: (turn, status, posi) ->
        super(turn, status, posi)
        @castling = true
        @gravity = 1.0
        @name = "Rook"
    # kind: ->
    #     @constructor.name

    koma: ->
        return if @turn == Const.FIRST then 'R' else 'r'

    omomi: ->
        ret = switch @status
            when Const.Status.OMOTE
                Rook.weight * (@gravity + @coefficient / Rook.potential[@status])
            when Const.Status.MOTIGOMA
                0
            else
                console.log("Error: Rook.omomi")
        return parseInt(ret, 10)

    caption: ->
        switch @status
            when Const.Status.OMOTE
                if @turn == Const.FIRST then String.fromCharCode(0x2656) else String.fromCharCode(0x265c)
            when Const.Status.MOTIGOMA
                if @turn == Const.FIRST then String.fromCharCode(0x265c) else String.fromCharCode(0x2656)
            else
                console.log("Rook.caption: Error")

class Pawn extends Piece
    _direction = {}
    _direction[Const.Status.OMOTE] = {}
    _direction[Const.Status.QUEEN] = {}
    _direction[Const.Status.BISHOP] = {}
    _direction[Const.Status.KNIGHT] = {}
    _direction[Const.Status.ROOK] = {}
    _direction[Const.Status.MOTIGOMA] = {}
    _direction[Const.Status.OMOTE][Const.SECOND] = [new Course(2, 0, -1), new Course(0, 1, -1), new Course(0, -1, -1)]
    _direction[Const.Status.OMOTE][Const.FIRST] = [new Course(2, 0, 1), new Course(0, -1, 1), new Course(0, 1, 1)]
    _direction[Const.Status.QUEEN][Const.SECOND] = [new Course(9, -1, -1), new Course(9, -1, 1), new Course(9, 1, 1), new Course(9, 1, -1), new Course(9, 0, -1), new Course(9, 0, 1), new Course(9, -1, 0), new Course(9, 1, 0)]
    _direction[Const.Status.QUEEN][Const.FIRST] = [new Course(9, 1, 1), new Course(9, 1, -1), new Course(9, -1, -1), new Course(9, -1, 1), new Course(9, 0, -1), new Course(9, 0, 1), new Course(9, -1, 0), new Course(9, 1, 0)]
    _direction[Const.Status.BISHOP][Const.SECOND] = [new Course(9, -1, -1), new Course(9, -1, 1), new Course(9, 1, 1), new Course(9, 1, -1)]
    _direction[Const.Status.BISHOP][Const.FIRST] = [new Course(9, 1, 1), new Course(9, 1, -1), new Course(9, -1, -1), new Course(9, -1, 1)]
    _direction[Const.Status.KNIGHT][Const.SECOND] = [new Course(0, 1, -2), new Course(0, -1, -2), new Course(0, 2, -1), new Course(0, -2, -1), new Course(0, 2, 1), new Course(0, -2, 1), new Course(0, 1, 2), new Course(0, -1, 2)]
    _direction[Const.Status.KNIGHT][Const.FIRST] = [new Course(0, -1, 2), new Course(0, 1, 2), new Course(0, -2, 1), new Course(0, 2, 1), new Course(0, -2, -1), new Course(0, 2, -1), new Course(0, -1, -2), new Course(0, 1, -2)]
    _direction[Const.Status.ROOK][Const.SECOND] = [new Course(9, 0, -1), new Course(9, -1, 0), new Course(9, 0, 1), new Course(9, 1, 0)]
    _direction[Const.Status.ROOK][Const.FIRST] = [new Course(9, 0, 1), new Course(9, 1, 0), new Course(9, 0, -1), new Course(9, -1, 0)]
    _direction[Const.Status.MOTIGOMA][Const.FIRST] = []
    _direction[Const.Status.MOTIGOMA][Const.SECOND] = []
    @potential = [2, 27, 13, 8, 14]
    @weight = 10
    @getD: (turn, status) ->
        return _direction[status][turn]

    constructor: (turn, status, posi) ->
        super(turn, status, posi)
        @enpassant = false
        @gravity = 1.0
        @promote = [Const.Status.QUEEN, Const.Status.BISHOP, Const.Status.KNIGHT, Const.Status.ROOK]
        @name = "Pawn"
    # kind: ->
    #     @constructor.name

    koma: ->
        switch @status
            when Const.Status.OMOTE
                if @turn == Const.FIRST then 'P' else 'p'
            when Const.Status.QUEEN
                if @turn == Const.FIRST then 'Q' else 'q'
            when Const.Status.BISHOP
                if @turn == Const.FIRST then 'B' else 'b'
            when Const.Status.KNIGHT
                if @turn == Const.FIRST then 'N' else 'n'
            when Const.Status.ROOK
                if @turn == Const.FIRST then 'R' else 'r'
    omomi: ->
        ret = switch @status
            when Const.Status.OMOTE
                Pawn.weight * (@gravity + @coefficient / Pawn.potential[@status])
            when Const.Status.QUEEN
                Queen.weight * (@gravity + @coefficient / Pawn.potential[@status])
            when Const.Status.BISHOP
                Bishop.weight * (@gravity + @coefficient / Pawn.potential[@status])
            when Const.Status.KNIGHT
                Knight.weight * (@gravity + @coefficient / Pawn.potential[@status])
            when Const.Status.ROOK
                Rook.weight * (@gravity + @coefficient / Pawn.potential[@status])
            when Const.Status.MOTIGOMA
                0
            else
                console.log("Pawn.omomi: Error @status = #{@status}")
        return parseInt(ret, 10)

    caption: ->
        switch @status
            when Const.Status.OMOTE
                if @turn == Const.FIRST then String.fromCharCode(0x2659) else String.fromCharCode(0x265f)
            when Const.Status.QUEEN
                if @turn == Const.FIRST then String.fromCharCode(0x2655) else String.fromCharCode(0x265b)
            when Const.Status.BISHOP
                if @turn == Const.FIRST then String.fromCharCode(0x2657) else String.fromCharCode(0x265d)
            when Const.Status.KNIGHT
                if @turn == Const.FIRST then String.fromCharCode(0x2658) else String.fromCharCode(0x265e)
            when Const.Status.ROOK
                if @turn == Const.FIRST then String.fromCharCode(0x2656) else String.fromCharCode(0x265c)
            when Const.Status.MOTIGOMA
                if @turn == Const.FIRST then String.fromCharCode(0x265f) else String.fromCharCode(0x2659)
            else
                console.log("Pawn.caption: Error")

module.exports =
    Course: Course
    Piece: Piece
    King: King
    Queen: Queen
    Bishop: Bishop
    Knight: Knight
    Rook: Rook
    Pawn: Pawn
global.gPiece = Piece
global.gKing = King
global.gQueen = Queen
global.gBishop = Bishop
global.gKnight = Knight
global.gRook = Rook
global.gPawn = Pawn
global.getClass = @getClass
