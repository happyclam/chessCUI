Const = require('./const')
Piece = require('./piece')

Array::unique = ->
    output = {}
    output[@[key]] = @[key] for key in [0...@length]
    value for key, value of output

class Board extends Array
    @promotion_line = [1, 8]
    constructor: ->
        super()
        @rows = Const.COLS
        @cols = Const.ROWS
        for r in [0...@rows]
            @[r] = new Array(@cols).fill(null)
        @pieces = []
        @kiki = {}

    cloneBoard: ->
        clone = new Board(@rows, @cols)
        for v in @pieces
            clone[v.posi[0] - 1][v.posi[1] - 1] = v if v.posi.length > 0
        return clone

    set_standard: ->
        @pieces = []
        @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,2]))
        @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,2]))
        @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,2]))
        @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [4,2]))
        @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [5,7]))
        @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,7]))
        @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [6,2]))
        @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,2]))
        @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        @pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,1]))
        @pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,8]))
        @pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,1]))
        @pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [6,1]))
        @pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [3,8]))
        @pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [6,8]))
        @pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,1]))
        @pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,1]))
        @pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,8]))
        @pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [7,8]))
        @pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [1,1]))
        @pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [8,1]))
        @pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        @pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,8]))
        @pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [5,1]))
        @pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [5,8]))
        return

        # stalemate0
        # @pieces = []
        # @pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,6]))
        # @pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [6,8]))
        # @pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [8,5]))
        # @pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [1,6]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,6]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,7]))
        # @pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [3,1]))
        # return

        # stalemate-PIN
        # @pieces = []
        # @pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,1]))
        # @pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,4]))
        # @pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        # @pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [4,5]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,2]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,3]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        # @pieces.push(new Piece.Queen(Const.FIRST, Const.Status.OMOTE, [4,3]))
        # # @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,2]))
        # @pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [5,2]))
        # @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,2]))
        # return

        # stalemate1
        # @pieces = []
        # @pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [1,1]))
        # @pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [4,7]))
        # @pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [2,3]))
        # @pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [5,2]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [1,7]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [2,7]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [3,7]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,7]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,5]))
        # @pieces.push(new Piece.Rook(Const.FIRST, Const.Status.OMOTE, [6,5]))
        # return

        # stalemate2
        # @pieces = []
        # @pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [3,6]))
        # @pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [3,8]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [6,5]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [7,7]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [8,6]))
        # @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,7]))
        # @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [5,4]))
        # @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [7,6]))
        # @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [8,5]))
        # return

        # stalemate3
        # @pieces = []
        # @pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,8]))
        # @pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        # @pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [5,7]))
        # @pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        # @pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [8,1]))
        # @pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,7]))
        # return

        # stalemate4
        # @pieces = []
        # @pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [8,1]))
        # @pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [1,6]))
        # @pieces.push(new Piece.Queen(Const.SECOND, Const.Status.OMOTE, [7,3]))
        # @pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [1,5]))
        # @pieces.push(new Piece.Bishop(Const.SECOND, Const.Status.OMOTE, [2,5]))
        # @pieces.push(new Piece.Knight(Const.SECOND, Const.Status.OMOTE, [2,6]))
        # @pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [1,8]))
        # @pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [6,2]))
        # @pieces.push(new Piece.Pawn(Const.SECOND, Const.Status.OMOTE, [4,6]))
        # @pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [2,8]))
        # @pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [3,8]))
        # @pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [2,3]))
        # @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [1,7]))
        # @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [2,7]))
        # @pieces.push(new Piece.Pawn(Const.FIRST, Const.Status.OMOTE, [3,7]))
        # return

        # case1
        # @pieces = []
        # @pieces.push(new Piece.King(Const.FIRST, Const.Status.OMOTE, [6,8]))
        # @pieces.push(new Piece.King(Const.SECOND, Const.Status.OMOTE, [8,8]))
        # @pieces.push(new Piece.Bishop(Const.FIRST, Const.Status.OMOTE, [5,7]))
        # @pieces.push(new Piece.Knight(Const.FIRST, Const.Status.OMOTE, [7,5]))
        # @pieces.push(new Piece.Rook(Const.SECOND, Const.Status.OMOTE, [7,7]))
        # return

    add: (piece) ->
        @pieces.push(piece)
        return

    gameover: ->
        kings = (v for v in @pieces when v.name == 'King' && v.turn == Const.FIRST)
        switch kings.length
            when 2
                return Const.FIRST
            when 0
                return Const.SECOND
            else
                return false

    display: ->
        # console.log(@pieces)
        # console.log(@motigoma)
        for v,i in @pieces when v.turn == Const.SECOND && v.status == Const.Status.MOTIGOMA
            process.stdout.write(v.caption()) if v?
        process.stdout.write("\n")

        for row in [@rows..1] by -1
            process.stdout.write(row.toString())
            for col in [1..@cols]
                koma = (v for v in @pieces when v.posi? && v.posi[0] == col && v.posi[1] == row)
                # console.log("====== Error =========") if koma.length > 1
                # console.log(koma) if koma.length > 1
                process.stdout.write("|" + if koma.length != 0 then koma[0].caption() else " ")
            process.stdout.write("|\n")
        process.stdout.write(" ")
        for col in [1..@cols]
            process.stdout.write(" " + String.fromCharCode(48 + col.toString().charCodeAt()))
        process.stdout.write("\n")
        for v,i in @pieces when v.turn == Const.FIRST && v.status == Const.Status.MOTIGOMA
            process.stdout.write(v.caption()) if v?
        process.stdout.write("\n")
        return

    make_kiki: (turn, exclude = null) ->
        @kiki[turn] = []
        src = []
        src = ((null for c in [1..@cols]) for r in [1..@rows])
        for v in @pieces
            src[v.posi[0] - 1][v.posi[1] - 1] = v if v.posi.length != 0
        selected = (v for v in @pieces when v.turn == turn && v.status != Const.Status.MOTIGOMA && v.name != exclude)
        for col in [1..@cols]
            for row in [1..@rows]
                for v in selected
                    if check_kiki.call @, v, [row, col], src
                        # console.log(v)
                        # console.log("=== col = #{col}, rol = #{row}")
                        @kiki[turn].push([row, col])
                        break
        return

    make_kiki_value: ->
        @kiki[Const.FIRST] = []
        @kiki[Const.SECOND] = []
        for v in @pieces
            v.coefficient = 0
            if v.status != Const.Status.MOTIGOMA
                count_kiki.call @, v
                count_rank.call @, v if v.name == 'Pawn'
        @kiki[Const.FIRST] = @kiki[Const.FIRST].unique()
        @kiki[Const.SECOND] = @kiki[Const.SECOND].unique()
        return

    check_move: (piece, d_posi, d_piece = null) ->
        # console.log("check_move")
        force_promo = false
        if d_piece?
            dest = d_piece
        else
            dest = (v for v in @pieces when v.posi? && v.posi[0] == d_posi[0] && v.posi[1] == d_posi[1])[0]

        oppo = if piece.turn == Const.FIRST then Const.SECOND else Const.FIRST
        kind = piece.name
        if kind == 'Pawn' && piece.status == Const.Status.OMOTE && !check_potential.call @, piece, d_posi
            if @check_promotion(piece, d_posi)
                force_promo = true
            else
                # console.log("check01")
                console.log("--- Error in Board.check_move ---")
                return false

        if kind == 'King' && !dest? && piece.turn == Const.FIRST && piece.posi[0] == 5 && piece.posi[1] == 1 && d_posi[0] == 7 && d_posi[1] == 1
            # 相手の駒の利き情報生成
            @make_kiki(oppo)
            # 相手の駒の利きにKingの位置かKingの通り道が入っていればキャスリング不可
            if (o for o in @kiki[oppo] when (o[0] == piece.posi[0] && o[1] == piece.posi[1]) || (o[0] == 6 && o[1] == 1) || (o[0] == 7 && o[1] == 1))[0]?
                # console.log("check02")
                return false
            rook = (v for v in @pieces when v.turn == piece.turn && v.posi? && v.posi[0] == 8 && v.posi[1] == 1)[0]
            obstacle1 = (v for v in @pieces when v.posi? && v.posi[0] == 6 && v.posi[1] == 1)[0]
            obstacle2 = (v for v in @pieces when v.posi? && v.posi[0] == 7 && v.posi[1] == 1)[0]
            if rook? && rook.castling && piece.castling && !obstacle1? && !obstacle2?
                # console.log("check03")
                return true
            else
                # console.log("check04")
                return false
        else if kind == 'King' && !dest? && piece.turn == Const.FIRST && piece.posi[0] == 5 && piece.posi[1] == 1 && d_posi[0] == 3 && d_posi[1] == 1
            @make_kiki(oppo)
            if (o for o in @kiki[oppo] when (o[0] == piece.posi[0] && o[1] == piece.posi[1]) || (o[0] == 4 && o[1] == 1) || (o[0] == 3 && o[1] == 1))[0]?
                # console.log("check05")
                return false
            rook = (v for v in @pieces when v.turn == piece.turn && v.posi? && v.posi[0] == 1 && v.posi[1] == 1)[0]
            obstacle1 = (v for v in @pieces when v.posi? && v.posi[0] == 2 && v.posi[1] == 1)[0]
            obstacle2 = (v for v in @pieces when v.posi? && v.posi[0] == 3 && v.posi[1] == 1)[0]
            obstacle3 = (v for v in @pieces when v.posi? && v.posi[0] == 4 && v.posi[1] == 1)[0]
            if rook? && rook.castling && piece.castling && !obstacle1? && !obstacle2? && !obstacle3?
                # console.log("check06")
                return true
            else
                # console.log("check07")
                return false
        else if kind == 'King' && !dest? && piece.turn == Const.SECOND && piece.posi[0] == 5 && piece.posi[1] == 8 && d_posi[0] == 7 && d_posi[1] == 8
            @make_kiki(oppo)
            if (o for o in @kiki[oppo] when (o[0] == piece.posi[0] && o[1] == piece.posi[1]) || (o[0] == 6 && o[1] == 8) || (o[0] == 7 && o[1] == 8))[0]?
                # console.log("check08")
                return false
            rook = (v for v in @pieces when v.turn == piece.turn && v.posi? && v.posi[0] == 8 && v.posi[1] == 8)[0]
            obstacle1 = (v for v in @pieces when v.posi? && v.posi[0] == 6 && v.posi[1] == 8)[0]
            obstacle2 = (v for v in @pieces when v.posi? && v.posi[0] == 7 && v.posi[1] == 8)[0]
            if rook? && rook.castling && piece.castling && !obstacle1? && !obstacle2?
                # console.log("check09")
                return true
            else
                # console.log("check10")
                return false
        else if kind == 'King' && !dest? && piece.turn == Const.SECOND && piece.posi[0] == 5 && piece.posi[1] == 8 && d_posi[0] == 3 && d_posi[1] == 8
            @make_kiki(oppo)
            if (o for o in @kiki[oppo] when (o[0] == piece.posi[0] && o[1] == piece.posi[1]) || (o[0] == 4 && o[1] == 8) || (o[0] == 3 && o[1] == 8))[0]?
                # console.log("check11")
                return false
            rook = (v for v in @pieces when v.turn == piece.turn && v.posi? && v.posi[0] == 1 && v.posi[1] == 8)[0]
            obstacle1 = (v for v in @pieces when v.posi? && v.posi[0] == 2 && v.posi[1] == 8)[0]
            obstacle2 = (v for v in @pieces when v.posi? && v.posi[0] == 3 && v.posi[1] == 8)[0]
            obstacle3 = (v for v in @pieces when v.posi? && v.posi[0] == 4 && v.posi[1] == 8)[0]
            if rook? && rook.castling && piece.castling && !obstacle1? && !obstacle2? && !obstacle3?
                # console.log("check12")
                return true
            else
                # console.log("check13")
                return false
        if kind == 'Pawn'
            enpassant = (v for v in @pieces when v.posi? && v.name == 'Pawn' && v.status == Const.Status.OMOTE && v.enpassant && v.turn == oppo)[0]
        else
            enpassant = null
        for v in getClass(kind).getD(piece.turn, piece.status)
            buf = [].concat(piece.posi)
            buf[0] += v.xd; buf[1] += v.yd
            if (buf[0] == d_posi[0] && buf[1] == d_posi[1])
                if dest?
                    if (piece.turn != dest.turn)
                        # Pawnは異動先に敵駒がある時でも直進は出来ない
                        unless kind == 'Pawn' && piece.status == Const.Status.OMOTE && v.series > 0
                            piece.status = piece.promote[0] if force_promo
                            # piece.status = Const.Status.QUEEN if force_promo
                            # console.log("check14")
                            return true
                else
                    # 異動先に駒が無くてもenpassantフラグが立っている駒がある場合はチェック
                    # enpassanフラグが立っている駒の方向にだけ進める
                    if enpassant? && kind == 'Pawn' && piece.status == Const.Status.OMOTE && v.series <= 0 && buf[0] == enpassant.posi[0] && piece.posi[1] == enpassant.posi[1]
                        # console.log("=== check15")
                        return true
                    # Pawnは異動先に敵駒がある時しか行けない
                    unless kind == 'Pawn' && piece.status == Const.Status.OMOTE && v.series <= 0
                        piece.status = piece.promote[0] if force_promo
                        # piece.status = Const.Status.QUEEN if force_promo
                        # console.log("=== check16")
                        return true
            if v.series > 0
                cnt = v.series
                while (buf[0] in [1..@cols]) && (buf[1] in [1..@rows]) && cnt > 0
                    if (buf[0] == d_posi[0] && buf[1] == d_posi[1])
                        if !dest?
                            # Pawnは異動先に駒が無くて、初期状態の時だけ２つ異動出来る
                            unless kind == 'Pawn' && piece.status == Const.Status.OMOTE && ((piece.posi[1] != 2 && piece.turn == Const.FIRST) || (piece.posi[1] != 7 && piece.turn == Const.SECOND))
                                # console.log("=== check17")
                                return true
                        else
                            if (piece.turn != dest.turn)
                                # Pawnは異動先に駒があると行けない
                                unless kind == 'Pawn' && piece.status == Const.Status.OMOTE
                                    # console.log("=== check18")
                                    return true
                            else
                                break
                    else
                        break if (o for o in @pieces when o.posi? && o.posi[0] == buf[0] && o.posi[1] == buf[1])[0]?
                    buf[0] += v.xd; buf[1] += v.yd
                    cnt -= 1
        # console.log("check19")
        return false

    # 成れるかどうか判定
    check_promotion: (piece, d_posi) ->
        return false unless piece.status == Const.Status.OMOTE
        return false if piece.name != 'Pawn'
        switch piece.turn
            when Const.SECOND
                return true if (d_posi[1] <= Board.promotion_line[0])
            when Const.FIRST
                return true if (d_posi[1] >= Board.promotion_line[1])
        return false

    move_capture: (piece, d_posi, d_piece = null) ->
        if d_piece?
            dest = d_piece
        else
            dest = (v for v in @pieces when v.posi? && v.posi[0] == d_posi[0] && v.posi[1] == d_posi[1])[0]
        if dest?
            dest.status = Const.Status.MOTIGOMA
            dest.setTurn(piece.turn)
            dest.posi = []
        else
            kind = piece.name
            if piece.turn == Const.FIRST
                piece.castling = false if kind == 'King' || kind == 'Rook'
                if kind == 'King' && piece.posi[0] == 5 && piece.posi[1] == 1 && d_posi[0] == 7 && d_posi[1] == 1
                    rook = (v for v in @pieces when v.posi? && v.posi[0] == 8 && v.posi[1] == 1)[0]
                    rook.posi[0] = 6; rook.posi[1] = 1; piece.castled = Const.KING_CASTLING
                else if kind == 'King' && piece.posi[0] == 5 && piece.posi[1] == 1 && d_posi[0] == 3 && d_posi[1] == 1
                    rook = (v for v in @pieces when v.posi? && v.posi[0] == 1 && v.posi[1] == 1)[0]
                    rook.posi[0] = 4; rook.posi[1] = 1; piece.castled = Const.QUEEN_CASTLING
                if kind == 'Pawn' && piece.status == Const.Status.OMOTE && piece.posi[1] == 2 && d_posi[1] == 4
                    piece.enpassant = true
                # アンパッサンフラグを立てる
                enpassant = (v for v in @pieces when v.turn == Const.SECOND && v.posi? && v.name == 'Pawn' && v.status == Const.Status.OMOTE && v.enpassant == true && v.posi[1] == 5)[0]
                # アンパッサンフラグが立っていたら解除してturnを変更
                if kind == 'Pawn' && enpassant? && enpassant.turn != piece.turn && Math.abs(piece.posi[0] - enpassant.posi[0]) == 1 && d_posi[1] == 6 && d_posi[0] == enpassant.posi[0]
                    enpassant.enpassant = false
                    enpassant.setTurn(piece.turn)
                    enpassant.status = Const.Status.MOTIGOMA
                    enpassant.posi = []
            else if piece.turn == Const.SECOND
                piece.castling = false if kind == 'King' || kind == 'Rook'
                if kind == 'King' && piece.posi[0] == 5 && piece.posi[1] == 8 && d_posi[0] == 7 && d_posi[1] == 8
                    rook = (v for v in @pieces when v.posi? && v.posi[0] == 8 && v.posi[1] == 8)[0]
                    rook.posi[0] = 6; rook.posi[1] = 8; piece.castled = Const.KING_CASTLING
                else if kind == 'King' && piece.posi[0] == 5 && piece.posi[1] == 8 && d_posi[0] == 3 && d_posi[1] == 8
                    rook = (v for v in @pieces when v.posi? && v.posi[0] == 1 && v.posi[1] == 8)[0]
                    rook.posi[0] = 4; rook.posi[1] = 8; piece.castled = Const.QUEEN_CASTLING
                # アンパッサンフラグを立てる
                if kind == 'Pawn' && piece.status == Const.Status.OMOTE && piece.posi[1] == 7 && d_posi[1] == 5
                    piece.enpassant = true
                enpassant = (v for v in @pieces when v.turn == Const.FIRST && v.posi? && v.name == 'Pawn' && v.status == Const.Status.OMOTE && v.enpassant == true && v.posi[1] == 4)[0]
                # アンパッサンフラグが立っていたら解除してturnを変更
                if kind == 'Pawn' && enpassant? && enpassant.turn != piece.turn && Math.abs(piece.posi[0] - enpassant.posi[0]) == 1 && d_posi[1] == 3 && d_posi[0] == enpassant.posi[0]
                    enpassant.setTurn(piece.turn)
                    enpassant.status = Const.Status.MOTIGOMA
                    enpassant.posi = []
            else
                console.log("Error in Board.move_capture")
        # 敵駒のアンパッサンフラグを全て解除（enpassantフラグが立っているのは常に一つだけ）
        for v in @pieces when v.name == 'Pawn' && v.turn != piece.turn
            v.enpassant = false
        s_posi = [].concat(piece.posi)
        piece.posi = [].concat(d_posi)
        piece.preposi = s_posi
        return s_posi

    cancel_castling: (piece) ->
        return false unless piece.castled?
        return false unless piece.name == 'King'
        if piece.turn == Const.FIRST
            if piece.castled == Const.KING_CASTLING
                rook = (v for v in @pieces when v.posi? && v.posi[0] == 6 && v.posi[1] == 1)[0]
                rook.posi[0] = 8; rook.posi[1] = 1; rook.castling = true
                piece.castled = null; piece.posi[0] = 5; piece.posi[1] = 1; piece.castling = true
            else if piece.castled == Const.QUEEN_CASTLING
                rook = (v for v in @pieces when v.posi? && v.posi[0] == 4 && v.posi[1] == 1)[0]
                rook.posi[0] = 1; rook.posi[1] = 1; rook.castling = true
                piece.castled = null; piece.posi[0] = 5; piece.posi[1] = 1; piece.castling = true
            else
                console.log("Error in Board.cancel_castling: #{piece}")
                return false
        else if piece.turn == Const.SECOND
            if piece.castled == Const.KING_CASTLING
                rook = (v for v in @pieces when v.posi? && v.posi[0] == 6 && v.posi[1] == 8)[0]
                rook.posi[0] = 8; rook.posi[1] = 8; rook.castling = true
                piece.castled = null; piece.posi[0] = 5; piece.posi[1] = 8; piece.castling = true
            else if piece.castled == Const.QUEEN_CASTLING
                rook = (v for v in @pieces when v.posi? && v.posi[0] == 4 && v.posi[1] == 8)[0]
                rook.posi[0] = 1; rook.posi[1] = 8; rook.castling = true
                piece.castled = null; piece.posi[0] = 5; piece.posi[1] = 8; piece.castling = true
            else
                console.log("Error in Board.cancel_castling: #{piece}")
                return false
        else
            console.log("Error in Board.cancel_castling: #{piece}")
            return false
        return true

    check_tumi: (turn) ->
        first_king = (v for v in @pieces when v.turn == Const.FIRST && v.name == 'King')[0]
        return [true, Const.MIN_VALUE] unless first_king
        second_king = (v for v in @pieces when v.turn == Const.SECOND && v.name == 'King')[0]
        return [true, Const.MAX_VALUE] unless second_king
        f_canmove = false; s_canmove = false
        first = 0; second = 0
        @make_kiki_value()

        # 王手が掛かっているかどうか
        s_oute = (o for o in @kiki[Const.FIRST] when o[0] == second_king.posi[0] && o[1] == second_king.posi[1])[0]?
        f_oute = (o for o in @kiki[Const.SECOND] when o[0] == first_king.posi[0] && o[1] == first_king.posi[1])[0]?

        # 味方の駒の位置も相手の利きに追加（玉が移動出来ない座標という意味では同じ）
        for v in @pieces when v.turn == Const.FIRST && v.status != Const.Status.MOTIGOMA
            @kiki[Const.SECOND].push(v.posi)
        for v in @pieces when v.turn == Const.SECOND && v.status != Const.Status.MOTIGOMA
            @kiki[Const.FIRST].push(v.posi)
        # console.log(@kiki[Const.FIRST])
        # console.log(@kiki[Const.SECOND])

        org = [].concat(first_king.posi)
        for v in Piece.King.getD(first_king.turn, first_king.status)
            dest = [org[0] + v.xd, org[1] + v.yd]
            continue unless (dest[0] in [1..@cols] && dest[1] in [1..@rows])
            if (o for o in @kiki[Const.SECOND] when o[0] == dest[0] && o[1] == dest[1])[0]?
                continue
            else
                f_canmove = true
                break
        org = [].concat(second_king.posi)
        for v in Piece.King.getD(second_king.turn, second_king.status)
            dest = [org[0] + v.xd, org[1] + v.yd]
            continue unless (dest[0] in [1..@cols] && dest[1] in [1..@rows])
            if (o for o in @kiki[Const.FIRST] when o[0] == dest[0] && o[1] == dest[1])[0]?
                continue
            else
                s_canmove = true
                break
        # @display()
        # console.log("turn = #{turn}")
        # console.log("f_oute = #{f_oute}")
        # console.log("s_oute = #{s_oute}")
        # console.log("f_canmove = #{f_canmove}")
        # console.log("s_canmove = #{s_canmove}")
        others_canmove = check_canmove.call @, (if turn == Const.FIRST then Const.SECOND else Const.FIRST)
        # console.log("others_canmove = #{JSON.stringify(others_canmove)}")
        # 先手が王手掛かっていて指したのが先手なら後手勝ち
        if f_oute && turn == Const.FIRST
            # console.log("check1")
            return [true, Const.MIN_VALUE]
        # 後手が王手掛かっていて指したのが後手なら先手勝ち
        else if s_oute && turn == Const.SECOND
            # console.log("check2")
            return [true, Const.MAX_VALUE]
        # 先手玉が動けなくて王手が掛かっていたら後手勝ち
        else if f_canmove == false && f_oute
            # 後手が王手放置していて指したのが後手なら先手勝ち
            if s_oute && turn == Const.SECOND
                # console.log("check3")
                return [true, Const.MAX_VALUE]
            else
                return [true, Const.CHECKMATE]
        # 後手玉が動けなくて王手が掛かっていたら先手勝ち
        else if s_canmove == false && s_oute
            # 先手が王手放置していて指したのが先手なら後手勝ち
            if f_oute && turn == Const.FIRST
                # console.log("check5")
                return [true, Const.MIN_VALUE]
            else
                return [true, Const.CHECKMATE]
        else if f_canmove == false && !f_oute && turn == Const.SECOND
            # @display()
            # console.log("efficient = #{first - second}")
            if others_canmove.length == 0
                # @display()
                # console.log("efficient = #{first - second}")
                return [true, Const.STALEMATE]
            else
                # console.log("others_canmove.kind = #{others_canmove[0].name}")
                # console.log("others_canmove = #{JSON.stringify(others_canmove[0])}")
                PIN_check = check_PIN.call @, Const.SECOND, first_king
                # console.log("PIN_check = #{JSON.stringify(PIN_check)}")
                # 動かせる駒がPINされているかどうか
                check_pin = (o for o in PIN_check[0] when o.posi[0] == others_canmove[0].posi[0] && o.posi[1] == others_canmove[0].posi[1]).length
                # PINしている敵駒に効きがあればSTALEMATEじゃない？
                @make_kiki(Const.FIRST)
                check_opposite = false
                for v in PIN_check[1]
                    check_opposite = true if (o for o in @kiki[Const.FIRST] when o[0] == v.posi[0] && o[1] == v.posi[1]).length > 0
                # console.log("check_pin = #{check_pin}")
                # console.log("check_opposite = #{check_opposite}")
                # console.log("others_canmove.length = #{others_canmove.length}")
                if (check_pin > 0) && !check_opposite && (others_canmove.length <= 1)
                    return [true, Const.STALEMATE]
        else if s_canmove == false && !s_oute && turn == Const.FIRST
            # console.log("first = #{JSON.stringify(@kiki[Const.FIRST])}")
            # console.log("second = #{JSON.stringify(@kiki[Const.SECOND])}")
            # @display()
            # console.log("efficient = #{first - second}")
            if others_canmove.length == 0
                return [true, Const.STALEMATE]
            else
                # console.log("others_canmove = #{JSON.stringify(others_canmove)}")
                PIN_check = check_PIN.call @, Const.FIRST, second_king
                # console.log("PIN_check = #{JSON.stringify(PIN_check)}")
                # 動かせる駒がPINされているかどうか
                check_pin = (o for o in PIN_check[0] when o.posi[0] == others_canmove[0].posi[0] && o.posi[1] == others_canmove[0].posi[1]).length
                # PINしている敵駒に効きがあればSTALEMATEじゃない？
                # console.log("kiki(first) = #{JSON.stringify(@kiki[Const.FIRST])}")
                # console.log("kiki(second) = #{JSON.stringify(@kiki[Const.SECOND])}")
                @make_kiki(Const.SECOND)
                check_opposite = false
                for v in PIN_check[1]
                    check_opposite = true if (o for o in @kiki[Const.SECOND] when o[0] == v.posi[0] && o[1] == v.posi[1]).length > 0
                # console.log("check_pin = #{check_pin}")
                # console.log("check_opposite = #{check_opposite}")
                # console.log("others_canmove.length = #{others_canmove.length}")
                if (check_pin > 0) && !check_opposite && (others_canmove.length <= 1)
                    return [true, Const.STALEMATE]
        for v in @pieces
            first += v.omomi() if v.turn == Const.FIRST
            second += v.omomi() if v.turn == Const.SECOND
        # console.log("check7")
        # console.log("first = #{(first)}")
        # console.log("second = #{(second)}")
        # console.log("evaluation = #{(first - second)}")
        # console.log("f_canmove = #{f_canmove}")
        # console.log("s_canmove = #{s_canmove}")
        # console.log("f_oute = #{f_oute}")
        # console.log("s_oute = #{s_oute}")
        # console.log("turn = #{turn}")
        # console.log("others_canmove = #{others_canmove}")
        # f_piece=(v for v in @pieces when v.name == "Pawn" && v.turn == Const.SECOND && v.posi.toString() == '5,5')[0]
        # if f_piece?
        #     console.log("------------------------------------------------")
        #     @display()
        #     # console.log(@pieces)
        return [false, (first - second)]

    # キング以外に動かせる駒が一つでもあればtrueを返す（check_moveの簡易版）
    # GUI側でステイルメイトをチェックするに使う（pinのケースに対応していないので先読み時には使えない）
    # pinチェック出来ないので今のところ未使用
    check_strict: (turn) ->
        for v in @pieces when v.turn == turn && v.status != Const.Status.MOTIGOMA && !(v.name == 'King')
            org = [].concat(v.posi)
            kind = v.name
            for w in getClass(kind).getD(v.turn, v.status)
                buf = [].concat(org)
                # console.log("1:buf = #{JSON.stringify(buf)}")
                # console.log("w = #{JSON.stringify(w)}")
                buf[0] += w.xd; buf[1] += w.yd
                # console.log("2:buf = #{JSON.stringify(buf)}")
                continue unless buf[0] in [1..@cols] && buf[1] in [1..@rows]
                dest = (x for x in @pieces when x.posi? && x.posi[0] == buf[0] && x.posi[1] == buf[1])[0]
                if dest?
                    if kind == 'Pawn' && v.status == Const.Status.OMOTE
                        if w.series > 0
                            continue
                        else
                            return true if dest.turn != turn
                    else
                        return true if dest.turn != turn
                else
                    if kind == 'Pawn' && v.status == Const.Status.OMOTE
                        if w.series > 0
                            return true
                        else
                            continue
                    else
                        return true
        return false

    check_PIN = (turn, king) ->
        pinned = []
        pinner = []
        for v in getClass(king.name).getD(king.turn, king.status)
            buf = [].concat(king.posi)
            linePinned = []
            linePinner = []
            loop
                buf[0] += v.xd; buf[1] += v.yd
                unless (buf[0] in [1..@cols] && buf[1] in [1..@rows])
                    linePinned = []
                    linePinner = []
                    break
                dest = (o for o in @pieces when o.posi? && o.posi[0] == buf[0] && o.posi[1] == buf[1])[0]
                if dest?
                    if dest.turn == king.turn
                        #同一ライン上に味方の駒が２個以上あればPINチェック不要
                        if (linePinned.length > 0 || linePinner.length > 0)
                            linePinned = []
                            linePinner = []
                            break
                        linePinned.push(dest)
                        # console.log("=== Push")
                        # console.log("king = #{JSON.stringify(king)}")
                        # console.log("v = #{JSON.stringify(v)}")
                        # console.log("buf = #{buf[0]} : #{buf[1]}")
                        # console.log("dest.kind = #{dest.name}")
                        # console.log("dest = #{JSON.stringify(dest)}")
                        # @display()
                    else
                        # 敵のQueenかRookで縦横方向ならPIN
                        if (dest.name in ['Queen', 'Rook'] && (v.xd == 0 || v.yd == 0))
                            linePinner.push(dest)
                            break
                        # 敵のQueenかBishopで斜め方向ならPIN
                        else if (dest.name in ['Queen', 'Bishop'] && (v.xd != 0 && v.yd != 0))
                            linePinner.push(dest)
                            break
                        else
                            # 同一ラインに敵の駒が現れた時点でPINチェック不要
                            linePinned = []
                            linePinner = []
                            break
            # console.log("linePinned = #{JSON.stringify(linePinned)}")
            pinned = pinned.concat(linePinned)
            pinner = pinner.concat(linePinner)
        # console.log("pinned = #{JSON.stringify(pinned)}")
        return [pinned, pinner]

    # キング以外に動かせる駒が一つでもあればtrueを返す（check_moveの簡易版）
    # 一箇所でも動ければいいのでseriesは考慮しない
    check_canmove = (turn) ->
        result = []
        for v in @pieces when v.turn == turn && v.status != Const.Status.MOTIGOMA && !(v.name in ['King'])
            kind = v.name
            for w in getClass(kind).getD(v.turn, v.status)
                buf = [].concat(v.posi)
                buf[0] += w.xd; buf[1] += w.yd
                continue unless buf[0] in [1..@cols] && buf[1] in [1..@rows]
                dest = (x for x in @pieces when x.posi? && x.posi[0] == buf[0] && x.posi[1] == buf[1])[0]
                if dest?
                    if kind == 'Pawn' && v.status == Const.Status.OMOTE
                        if w.series > 0
                            continue
                        else
                            if dest.turn != turn
                                result.push(v)
                                break
                    else
                        if dest.turn != turn
                            result.push(v)
                            break
                else
                    if kind == 'Pawn' && v.status == Const.Status.OMOTE
                        if w.series > 0
                            result.push(v)
                            break
                        else
                            continue
                    else
                        result.push(v)
                        break
        return result

    # 打った後、指した後に移動可能な場所が無い場合falseを返す
    check_potential = (piece, d_posi) ->
        for v in getClass(piece.name).getD(piece.turn, piece.status)
            if ((d_posi[0] + v.xd) > 0) && ((d_posi[1] + v.yd) > 0) && ((d_posi[0] + v.xd) <= @cols) && ((d_posi[1] + v.yd) <= @rows)
                return true
        return false

    check_kiki = (piece, d_posi, src) ->
        kind = piece.name
        for v in getClass(kind).getD(piece.turn, piece.status)
            buf = [].concat(piece.posi)
            cnt = v.series
            loop
                buf[0] += v.xd; buf[1] += v.yd
                break unless buf[0] in [1..@cols] && buf[1] in [1..@rows]
                # Pawnの連続移動（series）は利きとして扱わない
                break if kind == 'Pawn' && piece.status == Const.Status.OMOTE && v.series > 0
                return true if buf[0] == d_posi[0] && buf[1] == d_posi[1]
                break if src[buf[0] - 1][buf[1] - 1]?
                cnt -= 1
                break unless cnt > 0
        return false

    count_kiki = (piece) ->
        # console.log("piece = ")
        # console.log(piece)
        kind = piece.name
        for v in getClass(kind).getD(piece.turn, piece.status)
            buf = [].concat(piece.posi)
            cnt = v.series
            loop
                buf[0] += v.xd; buf[1] += v.yd
                break unless (buf[0] in [1..@cols] && buf[1] in [1..@rows])
                continue if kind == 'Pawn' && piece.status == Const.Status.OMOTE && v.series > 0
                dest = (o for o in @pieces when o.posi? && o.posi[0] == buf[0] && o.posi[1] == buf[1])[0]
                # console.log("dest = #{dest}")
                # 味方の駒でも利きデータは追加、但し駒の働き評価値（移動可能箇所数）にはカウントしない
                @kiki[piece.turn].push([buf[0], buf[1]])
                if dest?
                    if dest.turn == piece.turn
                        # # Pawn chainは加点
                        # piece.coefficient += 0.7 if kind == 'Pawn' && dest.name == 'Pawn'
                        break
                    else
                        piece.coefficient += 1
                        break
                else
                    piece.coefficient += 1
                cnt -= 1
                break unless (cnt > 0)
        # console.log("piece.coefficient = #{piece.coefficient}")
        # board.display()
        return

    count_rank = (piece) ->
        # console.log("piece = ")
        # console.log(piece)
        if piece.turn == Const.FIRST
            piece.coefficient += Math.sqrt(piece.posi[1])
        else if piece.turn == Const.SECOND
            piece.coefficient += Math.sqrt(9 - piece.posi[1])
        else
            console.log("Error: count_rank")
        # console.log("piece.coefficient = #{piece.coefficient}")
        return

module.exports = Board
