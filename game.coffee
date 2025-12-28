crypto = require('crypto');
Const = require('./const')
Piece = require('./piece')
Board = require('./board')
Player = require('./player')
# TestPlayer = require('./testplayer')

Array::unique = ->
    output = {}
    output[@[key]] = @[key] for key in [0...@length]
    value for key, value of output

dec_gravity = (seq) ->
    for v in b.pieces
        # g = seq * -0.1 + 5
        g = seq * -0.05 + 3.5        
        g = 1.0 if g < 1.0
        v.gravity = g

inc_gravity = (seq) ->
    for v in b.pieces
        g = seq * 0.1 - 1        
        g = 1.0 if g < 1
        g = 3.0 if g > 3
        v.gravity = g

set_gravity = (seq) ->
    for v in b.pieces
        g = seq
        v.gravity = g

startTime = new Date().getTime()
first = new Player(Const.FIRST, false)
second = new Player(Const.SECOND, false)
b = new Board()

state = []
counter = 0
sennitite = []
duplication = []

first.pre_select = 20
second.pre_select = 20
b.set_standard()
b.display()
first.depth = 3
second.depth = 3
ret = []
loop
    if first.human
        human_move = false
        until human_move
            process.stdout.write("指し手（駒,筋,段,成／不成,）を入力後、Ctrl+D\n")
            process.stdout.write("入力例(Pawn,6,3,1,):")
            input = require('fs').readFileSync('/dev/stdin', 'utf8')

            koma = input.split(',')[0]
            col = input.split(',')[1]
            row = input.split(',')[2]
            nari = input.split(',')[3]
            ret = []
            ret[0] = (v for v in b.pieces when v.name == koma && v.turn == first.turn)[0]
            continue unless ret[0]
            ret[1] = [parseInt(col, 10), parseInt(row, 10)]
            ret[2] = 0
            ret[3] = if parseInt(nari, 10) >= 1 then 1 else 0
            if b.check_move(ret[0], ret[1]) && (b.check_utifudume(ret[0], ret[1]) == false)
                console.log(ret)
                console.log("--- ---------------")
                s_posi = b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
                human_move = true
                md5hash = crypto.createHash('md5').update(JSON.stringify(b.pieces)).digest("hex")
    else
        enpassant = (v for v in b.pieces when v.posi? && v.name == 'Pawn' && v.status == Const.Status.OMOTE && v.enpassant == true)[0]
        if enpassant?
            org_enpassant = enpassant.enpassant
            org_posi = enpassant.posi
            org_status = enpassant.status
            org_turn = enpassant.turn
        else
            org_enpassant = null
            org_posi = null
            org_status = null
            org_turn = null
        temp = []; ret = []
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 34
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        # set_gravity(1.0)
        dec_gravity(counter)
        # 対人戦の場合は相手玉を取るまで指す
        for i in [0,1,first.depth].unique()
            temp = []
            if enpassant?
                enpassant.enpassant = org_enpassant
                enpassant.posi = org_posi
                enpassant.status = org_status
                enpassant.turn = org_turn
            if i >= 3
                temp = first.prepare(b, second, i, Const.MAX_VALUE)
            else
                first.pre_ahead = 0; second.pre_ahead = 0
                temp = first.think(b, second, i, Const.MAX_VALUE)
            if temp[0]?
                # console.log("first: i = #{i}, kind = #{temp[0].name}, temp = #{JSON.stringify(temp)}")
                ret = [].concat(temp)
                break if temp[0]? && (temp[2] >= Const.MAX_VALUE || temp[2] <= Const.MIN_VALUE)
            else
                # console.log("first: i = #{i}, kind = #{temp[0]}, temp = #{JSON.stringify(temp)}")
                break
        if ret[0]
            if enpassant?
                enpassant.enpassant = org_enpassant
                enpassant.posi = org_posi
                enpassant.status = org_status
                enpassant.turn = org_turn
            if b.check_move(ret[0], ret[1])
                s_posi = b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
            md5hash = crypto.createHash('md5').update(JSON.stringify(b.pieces)).digest("hex")
        else
            console.log("Second Win")
            break
    counter += 1
    state.push({"turn": ret[0].turn, "s_posi": s_posi, "move": [].concat(ret)})
    duplication.push(crypto.createHash('md5').update(JSON.stringify(b.pieces)).digest("hex"))
    b.display()
    elapsed = new Date().getTime() - startTime
    # console.log "初手経過時間: #{elapsed}ミリ秒"

    sennitite = (v for v in duplication when v == md5hash)
    if sennitite.length >= 3
        console.log("--- 千日手 ---")
        break

    if second.human
        human_move = false
        until human_move
            process.stdout.write("指し手（駒,筋,段,成／不成,）を入力後、Ctrl+D\n")
            process.stdout.write("入力例(Gi,2,1,1,):")
            input = require('fs').readFileSync('/dev/stdin', 'utf8')

            koma = input.split(',')[0]
            col = input.split(',')[1]
            row = input.split(',')[2]
            nari = input.split(',')[3]
            ret = []
            ret[0] = (v for v in b.pieces when v.name == koma && v.turn == second.turn)[0]
            continue unless ret[0]
            ret[1] = [parseInt(col, 10), parseInt(row, 10)]
            ret[2] = 0
            ret[3] = if parseInt(nari, 10) >= 1 then 1 else 0
            if b.check_move(ret[0], ret[1]) && b.check_utifudume(ret[0], ret[1]) == false
                s_posi = b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
                human_move = true
                md5hash = crypto.createHash('md5').update(JSON.stringify(b.pieces)).digest("hex")
    else
        enpassant = (v for v in b.pieces when v.posi? && v.name == 'Pawn' && v.status == Const.Status.OMOTE && v.enpassant == true)[0]
        if enpassant?
            org_enpassant = enpassant.enpassant
            org_posi = enpassant.posi
            org_status = enpassant.status
            org_turn = enpassant.turn
        else
            org_enpassant = null
            org_posi = null
            org_status = null
            org_turn = null
        temp = []; ret = []
        Piece.Queen.weight = 90
        Piece.Bishop.weight = 30
        Piece.Knight.weight = 30
        Piece.Rook.weight = 50
        Piece.Pawn.weight = 10
        set_gravity(1.0)
        # dec_gravity(counter)
        # 対人戦の場合は相手玉を取るまで指す
        for i in [0,1,second.depth].unique()
            temp = []
            if enpassant?
                enpassant.enpassant = org_enpassant
                enpassant.posi = org_posi
                enpassant.status = org_status
                enpassant.turn = org_turn
            if i >= 3
                temp = second.prepare(b, first, i, Const.MIN_VALUE)
            else
                first.pre_ahead = 0; second.pre_ahead = 0
                temp = second.think(b, first, i, Const.MIN_VALUE)
            if temp[0]?
                # console.log("second: i = #{i}, kind = #{temp[0].name}, temp = #{JSON.stringify(temp)}")
                ret = [].concat(temp)
                break if temp[0]? && (temp[2] >= Const.MAX_VALUE || temp[2] <= Const.MIN_VALUE)
            else
                # console.log("second: i = #{i}, kind = #{temp[0]}, temp = #{JSON.stringify(temp)}")
                break
        if ret[0]
            if enpassant?
                enpassant.enpassant = org_enpassant
                enpassant.posi = org_posi
                enpassant.status = org_status
                enpassant.turn = org_turn
            if b.check_move(ret[0], ret[1])
                s_posi = b.move_capture(ret[0], ret[1])
                ret[0].status = ret[3]
            md5hash = crypto.createHash('md5').update(JSON.stringify(b.pieces)).digest("hex")
        else
            console.log("First Win")
            break
    counter += 1
    state.push({"turn": ret[0].turn, "s_posi": s_posi, "move": [].concat(ret)})
    duplication.push(crypto.createHash('md5').update(JSON.stringify(b.pieces)).digest("hex"))
    b.display()
    sennitite = (v for v in duplication when v == md5hash)
    if sennitite.length >= 3
        console.log("--- 千日手 ---")
        break

console.log(counter)
# console.log(JSON.stringify(b.pieces))
# md5hash = crypto.createHash('md5').update(JSON.stringify(b.pieces)).digest("hex")
# console.log(md5hash)
# console.log(duplication)
elapsed = new Date().getTime() - startTime
console.log "経過時間: #{elapsed}ミリ秒"
