Const = require('./const')
Piece = require('./piece')

class Player
    # @depthプロパティはthink,prepareメソッドに渡す引数limitより大きな数値である必要がある
    # 読みの深さとしての属性（@depth）は許容量、実際の読みの深さとして渡すlimit引数の関係
    constructor:(@turn, @human, @depth = 2) ->
        @pre_ahead = 0
        @pre_select = 21
        @preparation = []

    prepare: (board, oppo, limit, preValue, pre_ahead = 2) ->
        @preparation = []
        @pre_ahead = pre_ahead
        ret = @think(board, oppo, @pre_ahead, preValue)
        if @turn == Const.FIRST
            @preparation.sort compScoreDescend
            # shellSortDesc.call @, @preparation
        else
            @preparation.sort compScoreAscend
            # shellSortAsc.call @, @preparation
        # console.log("@preparation")
        # console.log(@preparation)
        # console.log("--- @turn = #{@turn}:  @preparation.length = #{@preparation.length}")
        selection = {}
        selection["pieces"] = []
        selection["positions"] = []
        for v in @preparation
            buf = (w for w in board.pieces when w.id == v.id)
            # 同じ駒を打つ時は６カ所に制限
            # continue if (x for x in selection.positions when x.id == v.id && v.s_posi.length == 0).length > 5
            if buf.length > 0
                if (x for x in selection.pieces when x.id == v.id).length == 0
                    selection.pieces.push(buf[0])
                    selection.positions.push({id: v.id, posi: v.posi})
                if (x for x in selection.positions when x.id == v.id && x.posi == v.posi).length == 0
                    selection.positions.push({id: v.id, posi: v.posi})
            break if selection.positions.length > @pre_select
        # console.log("selection")
        # console.log(selection)
        @pre_ahead = -1
        ret = @think(board, oppo, limit, preValue, selection)
        # console.log("ret = #{JSON.stringify(ret)}")
        return ret

    think: (board, oppo, limit, preValue, priority = {}, check_flg = null) ->
        spare = {}
        lastscore = if @turn == Const.FIRST then Const.MIN_VALUE else Const.MAX_VALUE
        lastposi = null
        lastkoma = null
        laststatus = null
        score = 0
        kinds = []
        move_piece = new Piece.Piece(Const.First, Const.Status.OMOTE)
        dest_piece = new Piece.Piece(Const.First, Const.Status.OMOTE)
        # utifudume_flg = null
        src = board.cloneBoard()
        for v in board.pieces
            src[v.posi[0] - 1][v.posi[1] - 1] = v if v.posi.length != 0
        if Object.keys(priority).length != 0
            selections = priority.pieces
        else
            selections = board.pieces
        for koma in selections when koma.turn == @turn && koma.status != Const.Status.MOTIGOMA
            ai_directions = []
            # 同じ駒でも指す場所が複数になるので、この段階では複数の候補となる
            if Object.keys(priority).length != 0
                choice = priority.positions
            # for v in getClass(koma.name).getD(koma.turn, koma.status)
            # キャスリングを指し手の候補に入れるためにKingの動きをここだけ追加
            kind = koma.name
            if kind == 'King' && koma.castling
                ai_directions = (v for v in getClass(kind).getD(koma.turn, koma.status)).concat(new Piece.Course(0, 2, 0), new Piece.Course(0, -2, 0))
            else
                ai_directions = getClass(kind).getD(koma.turn, koma.status)
            for v in ai_directions
                buf = [].concat(koma.posi)
                loop
                    break unless ((buf[0] + v.xd in [1..board.cols]) && (buf[1] + v.yd in [1..board.rows]))
                    buf[0] += v.xd; buf[1] += v.yd
                    if Object.keys(priority).length != 0
                        continue unless (w for w in choice when koma.id == w.id && buf[0] == w.posi[0] && buf[1] == w.posi[1])[0]?
                    dest = src[buf[0] - 1][buf[1] - 1]
                    break if dest? && dest.turn == koma.turn
                    # move_piece = new Piece.Piece(koma.turn, koma.status, koma.posi)
                    move_piece.turn = koma.turn
                    move_piece.status = koma.status
                    move_piece.posi = [].concat(koma.posi)
                    move_enpassant = koma.enpassant if koma.enpassant?
                    move_castling = koma.castling if koma.castling?
                    enpassant = (w for w in board.pieces when w.posi? && w.name == 'Pawn' && w.status == Const.Status.OMOTE && w.enpassant == true)[0]
                    if enpassant?
                        org_enpassant = enpassant.enpassant
                        org_posi = enpassant.posi
                        org_status = enpassant.status
                        org_turn = enpassant.turn
                    if dest?
                        # dest_piece = new Piece.Piece(dest.turn, dest.status, dest.posi)
                        dest_piece.turn = dest.turn
                        dest_piece.status = dest.status
                        dest_piece.posi = [].concat(dest.posi)
                        dest_enpassant = dest.enpassant if dest.enpassant?
                        dest_castling = dest.castling if dest.castling?
                    if board.check_promotion(koma, buf)
                        promote_kinds = koma.promote.length
                    else
                        promote_kinds = 0
                    # pre_castled = koma.castled
                    if board.check_move(koma, buf, src[buf[0] - 1][buf[1] - 1])
                        board.move_capture(koma, buf, src[buf[0] - 1][buf[1] - 1])
                        loop
                            result = []
                            result = board.check_tumi(@turn)
                            # console.log("0: result[1] = #{result[1]}")
                            # board.display()
                            if limit > 0 && !result[0]
                                if limit > 0
                                    ret = oppo.think(board, @, limit - 1, lastscore, {})
                                    score = ret[2]
                                else
                                    # score = check_tumi.call @, board
                                    score = result[1]
                            else
                                # score = check_tumi.call @, board, priority
                                # score = board.check_tumi(@turn)
                                if !check_flg && result[1] == Const.CHECKMATE
                                    # console.log("1: result[1] = #{result[1]}")
                                    checkmate_threshold = if oppo.turn == Const.FIRST then Const.MAX_VALUE else Const.MIN_VALUE
                                    checkmate_ret = []
                                    checkmate_ret = oppo.think(board, @, limit - 1, checkmate_threshold, {})
                                    score = checkmate_ret[2]
                                else if !check_flg && result[1] == Const.STALEMATE
                                    stalemate_threshold = if oppo.turn == Const.FIRST then Const.MAX_VALUE else Const.MIN_VALUE
                                    stalemate_ret = []
                                    stalemate_ret = oppo.think(board, @, limit - 1, stalemate_threshold, {}, true)
                                    # score = stalemate_ret[2] * Const.STALEMATE_VALUE
                                    if (stalemate_ret[2] <= Const.MIN_VALUE && oppo.turn == Const.FIRST) || (stalemate_ret[2] >= Const.MAX_VALUE && oppo.turn == Const.SECOND)
                                        # ステイルメイトは負けになるわけでないので -1を掛けるのはやり過ぎ
                                        # 但し引き分け(評価値0)にすると引き分けになる方がマシと評価してしまう
                                        # ケースがあるのでなるべくステイルメイトを避けるように - 0.7 を掛ける
                                        score = stalemate_ret[2] * Const.STALEMATE_VALUE
                                        # console.log("=== check1")
                                        # board.display()
                                        # console.log("checkmate_ret = #{JSON.stringify(stalemate_ret)}")
                                        # console.log("score = #{score}")
                                    else
                                        score = stalemate_ret[2]
                                        # console.log("=== check2")
                                        # board.display()
                                        # console.log("checkmate_ret = #{JSON.stringify(stalemate_ret)}")
                                        # console.log("score = #{score}")
                                else
                                    score = result[1]

                            # board.display() if koma.name == 'King'
                            # console.log("score = #{score}") if koma.name == 'King'
                            # console.log("koma.castled = #{koma.castled}") if koma.name == 'King'
                            # if pre_castled == null && koma.castled? && !(score >= Const.MAX_VALUE || score <= Const.MIN_VALUE)
                            #     score += 6 if koma.turn == Const.FIRST
                            #     score -= 6 if koma.turn == Const.SECOND
                            @preparation.push {"id": koma.id,  "kind": kind,"s_posi": move_piece.posi, "posi": [].concat(buf), "status": koma.status, "score": score, "weight": koma.omomi()} if limit == @pre_ahead
                            shortCut = false
                            if (score > lastscore && @turn == Const.FIRST) || (score < lastscore && @turn == Const.SECOND)
                                # 大悪手を避けるため符号が同じケースだけ次善手情報（千日手回避用）を格納
                                if score * lastscore >= 0
                                    spare["koma"] = lastkoma
                                    spare["posi"] = [].concat(lastposi)
                                    spare["score"] = lastscore
                                    spare["status"] = laststatus
                                lastkoma = koma
                                lastscore = score
                                lastposi = [].concat(buf)
                                laststatus = koma.status
                                if ((preValue < score && @turn == Const.FIRST) || (preValue > score && @turn == Const.SECOND))
                                    shortCut = true
                            # 駒が成れる場合は成ってからもう一度評価する
                            if promote_kinds > 0
                                koma.status = koma.promote[promote_kinds - 1]
                                promote_kinds -= 1
                            else
                                break
                    koma.turn = move_piece.turn
                    koma.status = move_piece.status
                    koma.posi = move_piece.posi
                    koma.enpassant = move_enpassant if move_enpassant?
                    if move_castling? && move_castling == true && koma.castling == false
                        koma.castling = move_castling
                        board.cancel_castling(koma) if koma.castled?
                    if enpassant?
                        enpassant.enpassant = org_enpassant
                        enpassant.posi = org_posi
                        enpassant.status = org_status
                        enpassant.turn = org_turn
                    if dest?
                        dest.turn = dest_piece.turn
                        dest.status = dest_piece.status
                        dest.posi = dest_piece.posi
                        dest.enpassant = dest_enpassant if dest_enpassant?
                        dest.castling = dest_castling if dest_castling?
                    return [lastkoma, lastposi, lastscore, laststatus, spare] if (score >= Const.MAX_VALUE && @turn == Const.FIRST) || (score <= Const.MIN_VALUE && @turn == Const.SECOND)
                    return [lastkoma, lastposi, lastscore, laststatus, spare] if shortCut
                    break unless (!dest? && v.series > 0)
        return [lastkoma, lastposi, lastscore, laststatus, spare]

    compScoreAscend = (a, b) ->
        return a.score - b.score || a.weight - b.weight

    compScoreDescend = (a, b) ->
        return b.score - a.score || a.weight - b.weight

    shellSortAsc = (obj) ->
        h = 1
        while (h < Math.floor(obj.length / 9))
            h = h * 3 + 1
        while(h > 0)
            i = h
            while(i < obj.length)
                j = i
                while(j >= h)
                    if (obj[j - h].score > obj[j].score)
                        t = obj[j]
                        obj[j] = obj[j - h]
                        obj[j - h] = t
                    else if (obj[j - h].score == obj[j].score)
                        # 重みは常に昇順
                        if (obj[j - h].weight > obj[j].weight)
                            t = obj[j]
                            obj[j] = obj[j - h]
                            obj[j - h] = t
                        else if (obj[j - h].weight == obj[j].weight)
                            if Math.floor(Math.random() * 2) == 0
                                t = obj[j]
                                obj[j] = obj[j - h]
                                obj[j - h] = t
                    j = j - h
                i += 1
            h = Math.floor(h / 3)
        return obj

    shellSortDesc = (obj) ->
        h = 1
        while (h < Math.floor(obj.length / 9))
            h = h * 3 + 1
        while(h > 0)
            i = h
            while(i < obj.length)
                j = i
                while(j >= h)
                    if (obj[j - h].score < obj[j].score)
                        t = obj[j]
                        obj[j] = obj[j - h]
                        obj[j - h] = t
                    else if (obj[j - h].score == obj[j].score)
                        # 重みは常に昇順
                        if (obj[j - h].weight > obj[j].weight)
                            t = obj[j]
                            obj[j] = obj[j - h]
                            obj[j - h] = t
                        else if (obj[j - h].weight == obj[j].weight)
                            if Math.floor(Math.random() * 2) == 0
                                t = obj[j]
                                obj[j] = obj[j - h]
                                obj[j - h] = t
                    j = j - h
                i += 1
            h = Math.floor(h / 3)
        return obj

    count_kiki = (piece, board) ->
        # console.log("piece = ")
        # console.log(piece)
        for v in getClass(piece.name).getD(piece.turn, piece.status)
            buf = [].concat(piece.posi)
            cnt = v.series
            # console.log("==================================")
            # console.log("cnt = #{cnt}")
            loop
                buf[0] += v.xd; buf[1] += v.yd
                break unless (buf[0] in [1..board.cols] && buf[1] in [1..board.rows]) && cnt > 0
                dest = (o for o in board.pieces when o.posi? && o.posi[0] == buf[0] && o.posi[1] == buf[1])[0]
                # console.log("dest = #{dest}")
                if dest
                    if dest.turn == piece.turn
                        break
                    else
                        piece.coefficient += 1.0
                        break
                else
                    piece.coefficient += 1.0
                cnt -= 1
                # console.log("cnt = #{cnt}")
        # console.log("piece.coefficient = #{piece.coefficient}")
        # board.display()
        return

    inc_potential = (piece, board) ->
        piece.coefficient = 0.0
        src = []
        src = ((null for c in [1..Const.COLS]) for r in [1..Const.ROWS])
        for v in board.pieces
            src[v.posi[0] - 1][v.posi[1] - 1] = v if v.posi.length != 0
        for v in getClass(piece.name).getD(piece.turn, piece.status)
            # console.log("kind = #{piece.name}, v = #{JSON.stringify(v)}")
            if piece.posi.length > 0
                buf = [].concat(piece.posi)
                buf[0] += v.xd; buf[1] += v.yd
                continue unless (buf[0] in [1..board.cols]) && (buf[1] in [1..board.rows])
            else
                continue
            if v.series > 0
                cnt = v.series
                while (buf[0] in [1..board.cols]) && (buf[1] in [1..board.rows]) && cnt > 0
                    dest = src[buf[0] - 1][buf[1] - 1]
                    if dest?
                        piece.coefficient += 1.0 if (piece.turn != dest.turn)
                        break
                    else
                        piece.coefficient += 1.0
                    buf[0] += v.xd; buf[1] += v.yd
                    cnt -= 1
            else
                dest = src[buf[0] - 1][buf[1] - 1]
                if dest?
                    piece.coefficient += 1.0 if (piece.turn != dest.turn)
                else
                    piece.coefficient += 1.0 if (buf[0] in [1..board.cols]) && (buf[1] in [1..board.rows])
        return

    king_move = (board, koma) ->
        board.make_kiki(koma.turn)
        # console.log(board.kiki)
        oppo_king = (v for v in board.pieces when v.turn != koma.turn && v.name == 'King')[0]
        is_oute = (o for o in board.kiki[koma.turn] when o[0] == oppo_king.posi[0] && o[1] == oppo_king.posi[1])[0]?
        for v in getClass(oppo_king.name).getD(oppo_king.turn, oppo_king.status)
            buf = [].concat(oppo_king.posi)
            buf[0] += v.xd; buf[1] += v.yd
            # console.log("buf = #{buf}")
            continue unless (buf[0] in [1..board.cols]) && (buf[1] in [1..board.rows])
            unless (w for w in board.kiki[koma.turn] when w[0] == buf[0] && w[1] == buf[1])[0]?
                return [true, is_oute]
        return [false, is_oute]

module.exports = Player
