DECLARE FUNCTION GetMonsterName$ (ItsMonster AS ANY)
DECLARE FUNCTION atan! (x!, y!)
DECLARE SUB ShowPlayerStatus ()
DECLARE SUB SaveGame (saveplayerflag%, savemapflag%, savemonstersflag%, saveitemsflag%, itsfloor%)
DECLARE SUB GetXYItem (px%, py%, ItsItemList() AS ANY, ItsItemListLength%, returnitem AS ANY)
DECLARE SUB InitColorArray ()
DECLARE SUB ShowAmountSelection ()
DECLARE SUB GetPlayerOffenseDefense (offense%, defense%)
DECLARE SUB UseInventoryItem (index%)
DECLARE SUB DropInventoryItem (index%, amount%)
DECLARE SUB EquipItem (index%)
DECLARE SUB SortInventory ()
DECLARE SUB ShowInventory ()
DECLARE FUNCTION GetItemName$ (ItsItem AS ANY)
DECLARE SUB PickUpItem (ItsPlayer AS ANY, ItsInventory() AS ANY, ItsItemList() AS ANY, ItsItemListLength%)
DECLARE SUB DrawItemList (ItsItemList() AS ANY, length%, ItsPlayer AS ANY)
DECLARE SUB PrintItemListFile (itsfloor%)
DECLARE FUNCTION LoadItemListFile% ()
DECLARE SUB InitItem (ItsItem AS ANY)
DECLARE FUNCTION InitItemList% (ItemList() AS ANY, minitems%, maxitems%)
DECLARE SUB PlayerAttackMonster (ItsPlayer AS ANY, ItsMonster AS ANY)
DECLARE SUB MonsterAttackPlayer (ItsMonster AS ANY, ItsPlayer AS ANY)
DECLARE SUB AddMessage (msgstr$)
DECLARE SUB ShowMessage ()
DECLARE FUNCTION CheckCollidePlayerMonsterList% (ItsPlayer AS ANY, ItsMonster AS ANY)
DECLARE FUNCTION CheckCollideMonsterMonsterList% (ItsMonster AS ANY)
DECLARE FUNCTION CheckCollideMonsterMonster% (ItsMonster AS ANY)
DECLARE SUB DoMonster (ItsMonster AS ANY, ItsPlayer AS ANY)
DECLARE SUB DoMonsterList (ItsMonsterList() AS ANY, ItsLength AS INTEGER)
DECLARE FUNCTION DistanceFormula! (x1%, y1%, x2%, y2%)
DECLARE SUB PrintMonsterListFile (itsfloor%)
DECLARE FUNCTION LoadMonsterDataFile% ()
DECLARE SUB PrintMapMonsterFile ()
DECLARE SUB DrawMonsterList (MonsterList() AS ANY, length%, ItsPlayer AS ANY)
DECLARE SUB MonsterInit (arrayindex%, ItsMonster AS ANY, choice%)
DECLARE FUNCTION MonsterInitList% (MonsterList() AS ANY, minpopulation%, maxpopulation%)
DECLARE SUB DrawPlayerStatus (ItsPlayer AS ANY)
DECLARE SUB GetSetStairsPosIndex (choice%, index%, xpos%, ypos%, stairstype%)
DECLARE SUB ChangeFloor (ItsPlayer AS ANY, choice AS INTEGER)
DECLARE SUB MapRandomEmptyXY (choice AS INTEGER, xpos AS INTEGER, ypos AS INTEGER)
DECLARE SUB PrintPlayerDataFile ()
DECLARE FUNCTION LoadPlayerDataFile% ()
DECLARE SUB PlayerInit (ItsPlayer AS ANY, choice AS INTEGER)
DECLARE FUNCTION LoadLevelMapFile% ()
DECLARE SUB DoPlayerSight (ItsPlayer AS ANY)
DECLARE SUB AddLevelMapDetails ()
DECLARE FUNCTION PlayerInput! (ItsPlayer AS ANY)
DECLARE SUB DrawPlayerView (ItsPlayer AS ANY)
DECLARE SUB PrintLevelMapFile (itsfloor%)
DECLARE SUB PlayerInitXY (ItsPlayer AS ANY)
DECLARE SUB CreateRoom (centerx%, centery%, minwidth%, maxwidth%)
DECLARE SUB CreateSubPath (startx%, starty%, length%, turnrate%, branchrate%)
DECLARE SUB CreateMainPath (length%, turnrate%, branchrate%)
DECLARE SUB ChangePathDirection (currentx%, currenty%, xdir%, ydir%)
DECLARE SUB InitLevelMap ()
DECLARE SUB DrawLevelMap ()
DECLARE FUNCTION rand% (lowerbound%, upperbound%)
DECLARE FUNCTION ScanKey% (scancode%)
DECLARE FUNCTION LoadMonsterTable% ()
DECLARE SUB DisplayMonsterUniqueTable ()
DECLARE FUNCTION CheckStraightPathBlocked% (srcx%, srcy%, destx%, desty%, xlist%(), ylist%(), distance%)
DECLARE SUB ChooseMonsterAttack (ItsMonster AS ANY, attackname$, attackpower%, attackrange%)
DECLARE SUB Add2RangedAttackDrawList (xlist%(), ylist%(), distance%)
DECLARE SUB DrawRangedAttackDrawList ()
DECLARE SUB DrawPlayerFireRangedWeaponTargetCursor ()
DECLARE FUNCTION PlayerFireRangedWeapon% ()
DECLARE SUB InitKeyCodeIndexArray ()
DECLARE SUB DrawSpellTargetingCursor ()
DECLARE SUB DrawSpellListSelection ()
DECLARE FUNCTION PlayerUseSpell% (spellindex%, targetx%, targety%)

CONST TRUE = -1
CONST FALSE = 0

CONST TEXTSCREENWIDTH = 80
CONST TEXTSCREENHEIGHT = 23
CONST MAPWIDTH = TEXTSCREENWIDTH * 2
CONST MAPHEIGHT = TEXTSCREENHEIGHT * 2
CONST MAINPATHLENGTH = 500
CONST SUBPATHLENGTH = 50
CONST MINROOMWIDTH = 4
CONST MAXROOMWIDTH = 10
CONST MAXFLOOR = 10
CONST MINFLOOR = 1

CONST KEYCODEESC = 1
CONST KEYCODEUP = 72
CONST KEYCODEDOWN = 80
CONST KEYCODELEFT = 75
CONST KEYCODERIGHT = 77
CONST KEYCODELEFTSHIFT = &H2A
CONST KEYCODERIGHTSHIFT = &H36
CONST KEYCODECOMMA = &H33
CONST KEYCODEPERIOD = &H34

CONST KEYCODEQ = &H10
CONST KEYCODEW = &H11
CONST KEYCODEE = &H12
CONST KEYCODER = &H13
CONST KEYCODET = &H14
CONST KEYCODEY = &H15
CONST KEYCODEU = &H16
CONST KEYCODEI = &H17
CONST KEYCODEO = &H18
CONST KEYCODEP = &H19
CONST KEYCODEA = &H1E
CONST KEYCODES = &H1F
CONST KEYCODED = &H20
CONST KEYCODEF = &H21
CONST KEYCODEG = &H22
CONST KEYCODEH = &H23
CONST KEYCODEJ = &H24
CONST KEYCODEK = &H25
CONST KEYCODEL = &H26
CONST KEYCODEZ = &H2C
CONST KEYCODEX = &H2D
CONST KEYCODEC = &H2E
CONST KEYCODEV = &H2F
CONST KEYCODEB = &H30
CONST KEYCODEN = &H31
CONST KEYCODEM = &H32

CONST KEYCODEF1 = &H3B
CONST KEYCODEF2 = &H3C
CONST KEYCODEF3 = &H3D
CONST KEYCODEF4 = &H3E
CONST KEYCODEF5 = &H3F
CONST KEYCODEF6 = &H40
CONST KEYCODEF7 = &H41
CONST KEYCODEF8 = &H42
CONST KEYCODEF9 = &H43
CONST KEYCODEF10 = &H44
CONST KEYCODEF11 = &H45
CONST KEYCODEF12 = &H46

CONST KEYCODE1 = &H2
CONST KEYCODE2 = &H3
CONST KEYCODE3 = &H4
CONST KEYCODE4 = &H5
CONST KEYCODE5 = &H6
CONST KEYCODE6 = &H7
CONST KEYCODE7 = &H8
CONST KEYCODE8 = &H9
CONST KEYCODE9 = &HA
CONST KEYCODE0 = &HB

DIM SHARED KeyCodeIndexArray(1 TO 50) AS INTEGER

DIM SHARED LevelMap(0 TO MAPWIDTH - 1, 0 TO MAPHEIGHT - 1) AS INTEGER
DIM SHARED VisibilityMap(0 TO MAPWIDTH - 1, 0 TO MAPHEIGHT - 1) AS INTEGER

TYPE Player
    x AS INTEGER
    y AS INTEGER
    floor AS INTEGER
    hitpoints AS INTEGER

    class AS INTEGER
    level AS INTEGER
    strength AS INTEGER
    speed AS INTEGER
    intelligence AS INTEGER
    zeal AS INTEGER
    
    statuslist AS STRING * 10
    spelllist AS STRING * 50

END TYPE

CONST STATUSDEAD = 0
CONST STATUSNORMAL = 1

TYPE Monster

    arrayindex AS INTEGER
    statusflag AS INTEGER
    x AS INTEGER
    y AS INTEGER

    id AS INTEGER
    level AS INTEGER
    strength AS INTEGER
    speed AS INTEGER
    intelligence AS INTEGER
    zeal AS INTEGER

    char AS INTEGER
    hitpoints AS INTEGER
    radardistance AS INTEGER
    statuslist AS STRING * 10
    attack AS STRING * 10
    attrib AS STRING * 10

    sname AS STRING * 10

END TYPE

TYPE Item
    x AS INTEGER
    y AS INTEGER
    char AS INTEGER
    id AS INTEGER
    stackflag AS INTEGER
    stackcount AS INTEGER
    maxstacksize AS INTEGER
    canequipflag AS INTEGER
    equipstatus AS INTEGER
END TYPE

CONST IDPOTION = 1
CONST IDSWORD = 2
CONST IDSHIELD = 3
CONST IDHELMET = 4
CONST IDBODYARMOR = 5
CONST IDGLOVES = 6
CONST IDGREAVES = 7
CONST IDHAMMER = 8
CONST IDNECKLACE = 9
CONST IDRING = 10
CONST IDBOW = 11

CONST INVENTORYMAX = 20
DIM SHARED PlayerInventory(0 TO INVENTORYMAX - 1) AS Item

CONST ATTACK0MELEE0WEAPON = 48 + 1
CONST ATTACK0RANGED0WEAPON = 48 + 2
CONST ATTACK0BITE = 48 + 3
CONST ATTACK0BREATH = 48 + 4
CONST ATTACK0CLAW = 48 + 5
CONST ATTACK0KICK = 48 + 6
CONST ATTACK0TAIL = 48 + 7

CONST MAXCELLS = 100

DIM SHARED RangedAttackXList(1 TO MAXCELLS) AS INTEGER
DIM SHARED RangedAttackYList(1 TO MAXCELLS) AS INTEGER
DIM SHARED RangedAttackListCount AS INTEGER


DIM SHARED PlayerOne AS Player
DIM SHARED FileNotFoundFlag AS INTEGER
REM $DYNAMIC
DIM SHARED MonsterList(10) AS Monster
DIM SHARED MonsterListLength AS INTEGER
DIM SHARED ItemList(10) AS Item
DIM SHARED ItemListLength AS INTEGER
CONST MAXITEMLISTLENGTH = 100

                       
CONST MESSAGELISTMAX = 4
DIM SHARED MessageList(1 TO MESSAGELISTMAX) AS STRING
DIM SHARED ShowInventoryFlag AS INTEGER
DIM SHARED ShowPlayerStatusFlag AS INTEGER
DIM SHARED EquipmentSelectionStatus AS INTEGER
DIM SHARED DropItemFlag AS INTEGER
DIM SHARED EquipItemFlag AS INTEGER
DIM SHARED UseItemFlag AS INTEGER

DIM SHARED ColorArray(0 TO 255) AS INTEGER

CONST MAXUNIQUEMONSTERS = 100
DIM SHARED UniqueMonsterTable(1 TO MAXUNIQUEMONSTERS) AS Monster
DIM SHARED UniqueMonsterTableLength AS INTEGER

DIM SHARED PlayerFireRangedWeaponFlag AS INTEGER
DIM SHARED PlayerFireRangedWeaponTargetX AS INTEGER
DIM SHARED PlayerFireRangedWeaponTargetY AS INTEGER

DIM SHARED PlayerCastSpellFlag AS INTEGER
DIM SHARED SpellSelectionIndex AS INTEGER
DIM SHARED SpellTargetX AS INTEGER
DIM SHARED SpellTargetY AS INTEGER

RANDOMIZE TIMER / 3
CLS

InitKeyCodeIndexArray

'***test***
IF LoadMonsterTable = 0 THEN
    'DisplayMonsterUniqueTable
ELSE
    PRINT "Error: unable to load UniqueMonsterTable!"
    END
END IF

InitColorArray

DIM saveplayerflag%, savemapflag%, savemonstersflag%, saveitemsflag%

IF LoadPlayerDataFile = 1 THEN
    PlayerInit PlayerOne, 0
    saveplayerflag% = 1
END IF

IF LoadLevelMapFile = 1 THEN

    InitLevelMap
    CreateMainPath MAINPATHLENGTH, 10, 25
    AddLevelMapDetails
    PrintLevelMapFile PlayerOne.floor
    savemapflag% = 1
    saveplayerflag% = 1

END IF

IF saveplayerflag% = 1 OR savemapflag% = 1 THEN
  PlayerInit PlayerOne, 1
END IF

IF LoadMonsterDataFile = 1 THEN

    MonsterListLength = MonsterInitList(MonsterList(), 50, 60)
    savemonstersflag% = 1

END IF

IF LoadItemListFile = 1 THEN

    ItemListLength = InitItemList(ItemList(), 50, 60)
    saveitemsflag% = 1

END IF

SaveGame saveplayerflag%, savemapflag%, savemonstersflag%, saveitemsflag%, PlayerOne.floor

DoPlayerSight PlayerOne
DrawPlayerView PlayerOne
DrawItemList ItemList(), ItemListLength, PlayerOne
DrawMonsterList MonsterList(), MonsterListLength, PlayerOne
DrawPlayerStatus PlayerOne

DO

    IF PlayerInput(PlayerOne) = 1 THEN EXIT DO

LOOP


END

FileNotFoundError:
FileNotFoundFlag = 1
RESUME NEXT

REM $STATIC
SUB Add2RangedAttackDrawList (xlist%(), ylist%(), distance%)

DIM i%

FOR i% = 1 TO distance%
    RangedAttackListCount = RangedAttackListCount + 1
  
    IF RangedAttackListCount > MAXCELLS THEN
        RangedAttackListCount = MAXCELLS
        EXIT FOR
    END IF
  
    RangedAttackXList(RangedAttackListCount) = xlist%(i%)
    RangedAttackYList(RangedAttackListCount) = ylist%(i%)
NEXT i%

END SUB

SUB AddLevelMapDetails
DIM x AS INTEGER, y AS INTEGER, px AS INTEGER, py AS INTEGER
DIM i AS INTEGER


FOR y = 1 TO MAPHEIGHT - 2
    FOR x = 1 TO MAPWIDTH - 2
        IF LevelMap(x, y) = ASC(".") THEN
   
            FOR py = -1 TO 1
                FOR px = -1 TO 1
                    IF LevelMap(x + px, y + py) = ASC(" ") THEN
                        LevelMap(x + px, y + py) = ASC("#")
                    END IF
                NEXT px
            NEXT py

        END IF
    NEXT x
NEXT y

'* * * Add stairways * * *

MapRandomEmptyXY 0, x, y

FOR i = 1 TO 30
    MapRandomEmptyXY 1, x, y
    LevelMap(x, y) = ASC(">")
    MapRandomEmptyXY 1, x, y
    LevelMap(x, y) = ASC("<")
NEXT i

END SUB

SUB AddMessage (msgstr$)

'CONST MESSAGELISTMAX = 4
'DIM SHARED MessageList(1 to MESSAGELISTMAX) AS STRING

DIM i%

IF MessageList(1) <> "" THEN

    FOR i% = MESSAGELISTMAX TO 2 STEP -1
        MessageList(i%) = MessageList(i% - 1)
    NEXT i%

END IF

MessageList(1) = msgstr$

END SUB

FUNCTION atan! (x!, y!)

DIM retvalue!
CONST PI = 3.141592654#

retvalue! = ATN(ABS(y! / x!))

IF x! >= 0 AND y! >= 0 THEN
    '***null statement***
ELSEIF x! < 0 AND y! >= 0 THEN
    retvalue! = PI - retvalue!
ELSEIF x! < 0 AND y! < 0 THEN
    retvalue! = PI + retvalue!
ELSEIF x! >= 0 AND y! < 0 THEN
    retvalue! = 2 * PI - retvalue!
END IF

atan! = retvalue!

END FUNCTION

SUB ChangeFloor (ItsPlayer AS Player, choice AS INTEGER)

DIM okayflag%
DIM index%, xpos%, ypos%, stairstype%, oldfloor%
DIM saveplayerflag%, savemapflag%, savemonstersflag%, saveitemsflag%

xpos% = ItsPlayer.x
ypos% = ItsPlayer.y
oldfloor% = ItsPlayer.floor
stairstype% = LevelMap(xpos%, ypos%)

IF stairstype% <> ASC("<") AND stairstype% <> ASC(">") THEN
    stairstype% = ASC("<")
END IF

IF choice = -1 THEN
    ItsPlayer.floor = ItsPlayer.floor - 1
    IF ItsPlayer.floor < MINFLOOR THEN
        ItsPlayer.floor = MINFLOOR
    ELSE
        okayflag% = 1
    END IF

ELSEIF choice = 1 THEN
    ItsPlayer.floor = ItsPlayer.floor + 1
    IF ItsPlayer.floor > MAXFLOOR THEN
        ItsPlayer.floor = MAXFLOOR
    ELSE
        okayflag% = 1
    END IF
END IF

IF okayflag% = 1 THEN


    SaveGame 1, 0, 1, 1, oldfloor%


    GetSetStairsPosIndex 1, index%, xpos%, ypos%, stairstype%

    IF LoadLevelMapFile = 1 THEN

        InitLevelMap
        CreateMainPath MAINPATHLENGTH, 10, 25
        AddLevelMapDetails
        PlayerInit ItsPlayer, 1
        savemapflag% = 1
        saveplayerflag% = 1

    ELSE
        PlayerInit ItsPlayer, 1
        saveplayerflag% = 1
    END IF

    IF LoadMonsterDataFile = 1 THEN
        MonsterListLength = MonsterInitList(MonsterList(), 50, 60)
        savemonstersflag% = 1
    END IF

    IF LoadItemListFile = 1 THEN
        ItemListLength = InitItemList(ItemList(), 50, 60)
        saveitemsflag% = 1
    END IF


    IF stairstype% = ASC("<") THEN
        stairstype% = ASC(">")
    ELSEIF stairstype% = ASC(">") THEN
        stairstype% = ASC("<")
    END IF
    GetSetStairsPosIndex 2, index%, xpos%, ypos%, stairstype%
    ItsPlayer.x = xpos%
    ItsPlayer.y = ypos%

END IF

SaveGame saveplayerflag%, savemapflag%, savemonstersflag%, saveitemsflag%, PlayerOne.floor

END SUB

SUB ChangePathDirection (currentx%, currenty%, xdir%, ydir%)
' xdir% and ydir% each have to be within the range of -1 and 1

DIM xdirlist(0 TO 2) AS INTEGER
DIM ydirlist(0 TO 2) AS INTEGER
DIM i%, randchoice%, newx%, newy%

i% = 0
IF NOT (xdir% = -1 AND ydir% = 0) THEN
    xdirlist(i%) = -1: ydirlist(i%) = 0
    i% = i% + 1
END IF
IF NOT (xdir% = 0 AND ydir% = -1) THEN
    xdirlist(i%) = 0: ydirlist(i%) = -1
    i% = i% + 1
END IF

IF NOT (xdir% = 1 AND ydir% = 0) THEN
    xdirlist(i%) = 1: ydirlist(i%) = 0
    i% = i% + 1
END IF
IF NOT (xdir% = 0 AND ydir% = 1) THEN
    xdirlist(i%) = 0: ydirlist(i%) = 1
    i% = i% + 1
END IF

randchoice% = rand(0, 2)
xdir% = xdirlist(randchoice%)
ydir% = ydirlist(randchoice%)

FOR i% = 0 TO 2
    newx% = currentx% + xdir%
    newy% = currenty% + ydir%

    IF NOT (newx% < 1 OR newx% > MAPWIDTH - 2 OR newy% < 1 OR newy% > MAPHEIGHT - 2) THEN
        EXIT FOR
    ELSE
        xdir% = xdirlist(i%)
        ydir% = ydirlist(i%)
    END IF

NEXT i%

END SUB

FUNCTION CheckCollideMonsterMonsterList% (ItsMonster AS Monster)
DIM i%
CheckCollideMonsterMonsterList% = 0

FOR i% = 0 TO MonsterListLength - 1

    IF ItsMonster.arrayindex <> MonsterList(i%).arrayindex THEN
        IF MonsterList(i%).statusflag <> STATUSDEAD THEN
            IF ItsMonster.x = MonsterList(i%).x AND ItsMonster.y = MonsterList(i%).y THEN
                CheckCollideMonsterMonsterList% = 1
                EXIT FOR
            END IF
        END IF
    END IF
NEXT i%
       

END FUNCTION

FUNCTION CheckCollidePlayerMonsterList% (ItsPlayer AS Player, ItsMonster AS Monster)
DIM i%
CheckCollidePlayerMonsterList% = 0

FOR i% = 0 TO MonsterListLength - 1
    IF MonsterList(i%).statusflag <> STATUSDEAD THEN
        IF ItsPlayer.x = MonsterList(i%).x AND ItsPlayer.y = MonsterList(i%).y THEN
            CheckCollidePlayerMonsterList% = 1
            ItsMonster = MonsterList(i%)
            EXIT FOR
        END IF
    END IF
NEXT i%

END FUNCTION

FUNCTION CheckStraightPathBlocked% (srcx%, srcy%, destx%, desty%, xlist%(), ylist%(), distance%)

'Const PI = 3.141592654!
DIM xdelta!, ydelta!, xc!, yc!, radians!
DIM i%

xdelta! = destx% - srcx%: ydelta! = desty% - srcy%

distance% = SQR(xdelta! * xdelta! + ydelta! * ydelta!)
IF distance% < 1 THEN distance% = 1

xc! = srcx%: yc! = srcy%


radians! = atan(xdelta!, ydelta!)

FOR i% = 1 TO distance%

    xc! = xc! + COS(radians!)
    yc! = yc! + SIN(radians!)

    xlist%(i%) = xc!: ylist%(i%) = yc!

    IF LevelMap(xc!, yc!) = ASC("#") THEN
        'AddMessage STR$(FIX(xc!)) + "," + STR$(FIX(yc!))
        CheckStraightPathBlocked% = 1
        EXIT FOR
    END IF

NEXT i%



END FUNCTION

SUB ChooseMonsterAttack (ItsMonster AS Monster, attackname$, attackpower%, attackrange%)

DIM randnum%, attackn%, lower%, upper%

lower% = 2
upper% = ASC(LEFT$(ItsMonster.attack, 1)) - ASC("0") + 1

randnum% = rand(lower%, upper%)

attackn% = ASC(MID$(ItsMonster.attack, randnum%, 1))

SELECT CASE attackn%
    CASE ATTACK0MELEE0WEAPON
        attackname$ = "melee weapon"
        attackpower% = 1 + ItsMonster.strength / 2
        attackrange% = 1
    CASE ATTACK0RANGED0WEAPON
        attackname$ = "ranged weapon"
        attackpower% = 1! + ItsMonster.strength / 4 + ItsMonster.speed / 4
        attackrange% = 5
    CASE ATTACK0BITE
        attackname$ = "bite"
        attackpower% = ItsMonster.strength / 2
        attackrange% = 1
    CASE ATTACK0BREATH
        attackname$ = "breath"
        attackpower% = ItsMonster.strength / 4 + ItsMonster.speed / 4
        attackrange% = 10
    CASE ATTACK0CLAW
        attackname$ = "claw"
        attackpower% = ItsMonster.strength / 2
        attackrange% = 1
    CASE ATTACK0KICK
        attackname$ = "kick"
        attackpower% = ItsMonster.strength / 2
        attackrange% = 1
    CASE ATTACK0TAIL
        attackname$ = "tail"
        attackpower% = ItsMonster.strength / 2
        attackrange% = 1
    CASE ELSE
        attackname$ = "NULL" + STR$(randnum%) + " " + STR$(attackn%) + " " + ItsMonster.attack
        attackpower% = 1 + ItsMonster.strength / 2
        attackrange% = 1
END SELECT
   
END SUB

SUB CreateMainPath (length%, turnrate%, branchrate%)

DIM startx%, starty%, xdir%, ydir%, newx%, newy%, i%, k%
DIM randchoice%, subpathstartx%, subpathstarty%

startx% = rand(1, MAPWIDTH - 2)
starty% = rand(1, MAPHEIGHT - 2)

randchoice% = rand(0, 3)

SELECT CASE (randchoice%)
    CASE 0
        xdir% = -1: ydir% = 0
    CASE 1
        xdir% = 0: ydir% = -1
    CASE 2
        xdir% = 1: ydir% = 0
    CASE 3
        xdir% = 0: ydir% = 1
    CASE ELSE
END SELECT
                
FOR i% = 1 TO length%
 
    newx% = startx% + xdir%: newy% = starty% + ydir%

    IF newx% < 1 OR newx% > MAPWIDTH - 2 OR newy% < 1 OR newy% > MAPHEIGHT - 2 THEN
        ChangePathDirection startx%, starty%, xdir%, ydir%
        newx% = startx% + xdir%: newy% = starty% + ydir%

    ELSEIF rand(1, turnrate%) = 1 THEN
        ChangePathDirection startx%, starty%, xdir%, ydir%
        newx% = startx% + xdir%: newy% = starty% + ydir%
    END IF

    LevelMap(startx%, starty%) = ASC(".")
    startx% = newx%: starty% = newy%

    IF rand(1, branchrate%) = 1 THEN
        subpathstartx% = startx%
        subpathstarty% = starty%
        CreateSubPath subpathstartx%, subpathstarty%, SUBPATHLENGTH, turnrate%, branchrate%
        CreateRoom subpathstartx%, subpathstarty%, MINROOMWIDTH, MAXROOMWIDTH
    END IF

NEXT i%

END SUB

SUB CreateRoom (centerx%, centery%, minwidth%, maxwidth%)
DIM topleftx%, toplefty%, bottomxright%, bottomyright%
DIM roomwidthhalf%, roomheighthalf%
DIM x%, y%

roomwidthhalf% = rand(minwidth%, maxwidth%) / 2
roomheighthalf% = rand(minwidth%, maxwidth%) / 2

IF roomwidthhalf% < 1 THEN roomwidthhalf% = 1
IF roomheighthalf% < 1 THEN roomheighthalf% = 1

topleftx% = centerx% - roomwidthhalf%
toplefty% = centery% - roomheighthalf%
bottomrightx% = centerx% + roomwidthhalf%
bottomrighty% = centery% + roomheighthalf%

IF topleftx% < 1 THEN topleftx% = 1
IF topleftx% > MAPWIDTH - 2 THEN topleftx% = MAPWIDTH - 2
IF toplefty% < 1 THEN toplefty% = 1
IF toplefty% > MAPHEIGHT - 2 THEN toplefty% = MAPHEIGHT - 2

IF bottomrightx% < 1 THEN bottomrightx% = 1
IF bottomrightx% > MAPWIDTH - 2 THEN bottomrightx% = MAPWIDTH - 2
IF bottomrighty% < 1 THEN bottomrighty% = 1
IF bottomrighty% > MAPHEIGHT - 2 THEN bottomrighty% = MAPHEIGHT - 2

FOR y% = toplefty% TO bottomrighty%
    FOR x% = topleftx% TO bottomrightx%
        LevelMap(x%, y%) = ASC(".")
    NEXT x%
NEXT y%

END SUB

SUB CreateSubPath (startx%, starty%, length%, turnrate%, branchrate%)
DIM xdir%, ydir%, newx%, newy%, i%, k%
DIM randchoice%

randchoice% = rand(0, 3)

SELECT CASE (randchoice%)
    CASE 0
        xdir% = -1: ydir% = 0
    CASE 1
        xdir% = 0: ydir% = -1
    CASE 2
        xdir% = 1: ydir% = 0
    CASE 3
        xdir% = 0: ydir% = 1
    CASE ELSE
END SELECT
               
FOR i% = 1 TO length%

    newx% = startx% + xdir%: newy% = starty% + ydir%

    IF newx% < 1 OR newx% > MAPWIDTH - 2 OR newy% < 1 OR newy% > MAPHEIGHT - 2 THEN
        ChangePathDirection startx%, starty%, xdir%, ydir%
        newx% = startx% + xdir%: newy% = starty% + ydir%

    ELSEIF rand(1, turnrate%) = 1 THEN
        ChangePathDirection startx%, starty%, xdir%, ydir%
        newx% = startx% + xdir%: newy% = starty% + ydir%
    END IF

    LevelMap(startx%, starty%) = ASC(".")
    startx% = newx%: starty% = newy%
NEXT i%


END SUB

SUB DisplayMonsterUniqueTable

DIM i%, x%, y%
DIM mo AS Monster

LOCATE 1, 1
FOR i% = 1 TO UniqueMonsterTableLength

    mo = UniqueMonsterTable(i%)

PRINT mo.id; ","; mo.level; ","; mo.strength; ","; mo.speed; ","; mo.intelligence; ","; mo.zeal; ","; CHR$(mo.char); ","; mo.hitpoints; ","; mo.radardistance; ","; mo.attack; ","; mo.attrib; ","; mo.sname

NEXT i%

END SUB

FUNCTION DistanceFormula! (x1%, y1%, x2%, y2%)
DIM xdelta%, ydelta%

xdelta% = x1% - x2%
ydelta% = y1% - y2%

DistanceFormula! = SQR(xdelta% * xdelta% + ydelta% * ydelta%)

END FUNCTION

SUB DoMonster (ItsMonster AS Monster, ItsPlayer AS Player)
DIM distance%, xnew%, ynew%, xnext%, ynext%, x%, y%, xpos0%, ypos%
DIM dist1!, dist2!

xpos0% = ItsMonster.x
ypos0% = ItsMonster.y

'* * * follow player * * *

distance% = DistanceFormula(ItsMonster.x, ItsMonster.y, ItsPlayer.x, ItsPlayer.y)

IF distance% <= ItsMonster.radardistance THEN

    xnew% = 100
    ynew% = 100

    FOR y% = -1 TO 1
        FOR x% = -1 TO 1
            IF x% = 0 AND y% = 0 THEN
            ELSE
                xnext% = ItsMonster.x + x%
                ynext% = ItsMonster.y + y%
                dist1! = DistanceFormula(ItsPlayer.x, ItsPlayer.y, xnew%, ynew%)
                dist2! = DistanceFormula(ItsPlayer.x, ItsPlayer.y, xnext%, ynext%)

                IF dist2! <= dist1! AND LevelMap(xnext%, ynext%) <> ASC("#") THEN
                    xnew% = xnext%
                    ynew% = ynext%
                END IF
            END IF
        NEXT x%
    NEXT y%

    ItsMonster.x = xnew%
    ItsMonster.y = ynew%

    MonsterAttackPlayer ItsMonster, ItsPlayer

END IF

IF (ItsMonster.x = ItsPlayer.x AND ItsMonster.y = ItsPlayer.y) OR CheckCollideMonsterMonsterList(ItsMonster) = 1 THEN
    ItsMonster.x = xpos0%
    ItsMonster.y = ypos0%
END IF

IF ItsMonster.hitpoints <= 0 THEN
    ItsMonster.statusflag = STATUSDEAD
END IF

END SUB

SUB DoMonsterList (ItsMonsterList() AS Monster, ItsLength AS INTEGER)

DIM i%

FOR i% = 0 TO ItsLength - 1
    IF MonsterList(i%).statusflag <> STATUSDEAD THEN
        DoMonster ItsMonsterList(i%), PlayerOne
    END IF
NEXT i%

END SUB

SUB DoPlayerSight (ItsPlayer AS Player)
DIM i AS INTEGER, r AS INTEGER, x AS INTEGER, y AS INTEGER
DIM xc AS INTEGER, yc AS INTEGER

xc = ItsPlayer.x: yc = ItsPlayer.y

FOR i = 0 TO 359 STEP 10
    FOR r = 1 TO 20
        x = COS(i * 3.14159 / 180) * r + xc
        y = SIN(i * 3.14159 / 180) * r + yc

        IF NOT (x < 0 OR x > MAPWIDTH - 1 OR y < 0 OR y > MAPHEIGHT - 1) THEN
            VisibilityMap(x, y) = 1
            IF LevelMap(x, y) = ASC("#") THEN
                EXIT FOR
            END IF
        END IF
    NEXT r
NEXT i

END SUB

SUB DrawItemList (ItsItemList() AS Item, length%, ItsPlayer AS Player)
DIM i%, xdelta%, ydelta%, xpos%, ypos%, drawx%, drawy%
DIM halfwidth%, halfheight%

halfwidth% = TEXTSCREENWIDTH / 2
halfheight% = TEXTSCREENHEIGHT / 2

FOR i% = 0 TO length% - 1
    IF ItsItemList(i%).id <> 0 THEN
        xpos% = ItemList(i%).x
        ypos% = ItemList(i%).y

        IF NOT (xpos% = ItsPlayer.x AND ypos% = ItsPlayer.y) THEN
            xdelta% = xpos% - ItsPlayer.x
            ydelta% = ypos% - ItsPlayer.y

            IF ABS(xdelta%) <= TEXTSCREENWIDTH / 2 AND ABS(ydelta%) <= TEXTSCREENHEIGHT / 2 - 1 THEN
                IF VisibilityMap(xpos%, ypos%) = 1 THEN
                    drawx% = halfwidth% + xdelta%
                    drawy% = halfheight% + ydelta%
                    LOCATE drawy% + 1, drawx% + 1
                    COLOR ColorArray(ItemList(i%).char), 0
                    PRINT CHR$(ItemList(i%).char);
                END IF
            END IF
        END IF
    END IF
NEXT i%

END SUB

SUB DrawLevelMap

DIM x AS INTEGER, y AS INTEGER

FOR y = 0 TO TEXTSCREENHEIGHT - 1
    FOR x = 0 TO TEXTSCREENWIDTH - 1
        LOCATE y + 1, x + 1
        PRINT CHR$(LevelMap(x, y))
    NEXT x
NEXT y


END SUB

SUB DrawMonsterList (MonsterList() AS Monster, length%, ItsPlayer AS Player)
DIM i%, xdelta%, ydelta%, xpos%, ypos%, drawx%, drawy%
DIM halfwidth%, halfheight%

halfwidth% = TEXTSCREENWIDTH / 2
halfheight% = TEXTSCREENHEIGHT / 2

COLOR 10, 0

FOR i% = 0 TO length% - 1
    IF MonsterList(i%).statusflag <> STATUSDEAD THEN
        xpos% = MonsterList(i%).x
        ypos% = MonsterList(i%).y
        xdelta% = xpos% - ItsPlayer.x
        ydelta% = ypos% - ItsPlayer.y

        IF ABS(xdelta%) <= TEXTSCREENWIDTH / 2 AND ABS(ydelta%) <= TEXTSCREENHEIGHT / 2 - 1 THEN
            IF VisibilityMap(xpos%, ypos%) = 1 THEN
                drawx% = halfwidth% + xdelta%
                drawy% = halfheight% + ydelta%
                LOCATE drawy% + 1, drawx% + 1
                PRINT CHR$(MonsterList(i%).char);
            END IF
        END IF

    END IF
NEXT i%
END SUB

SUB DrawPlayerFireRangedWeaponTargetCursor

DIM halfwidth%, halfheight%

halfwidth% = TEXTSCREENWIDTH / 2
halfheight% = TEXTSCREENHEIGHT / 2

COLOR 12, 0
LOCATE PlayerFireRangedWeaponTargetY + halfheight% + 1, PlayerFireRangedWeaponTargetX + halfwidth% + 1
PRINT "*"

LOCATE TEXTSCREENHEIGHT, 2
PRINT "Select target to attack..."

END SUB

SUB DrawPlayerStatus (ItsPlayer AS Player)
COLOR 10, 0
LOCATE TEXTSCREENHEIGHT, 2
PRINT USING "& ### & ###"; "HP:"; ItsPlayer.hitpoints; "FLOOR:"; ItsPlayer.floor;
END SUB

SUB DrawPlayerView (ItsPlayer AS Player)

DIM x%, y%, px%, py%
DIM halfwidth%, halfheight%, startx%, starty%

halfwidth% = TEXTSCREENWIDTH / 2
halfheight% = TEXTSCREENHEIGHT / 2

startx% = ItsPlayer.x - halfwidth%
starty% = ItsPlayer.y - halfheight%

FOR y% = 0 TO TEXTSCREENHEIGHT - 1
    FOR x% = 0 TO TEXTSCREENWIDTH - 1
        COLOR 7, 0
        LOCATE y% + 1, x% + 1
        px% = startx% + x%: py% = starty% + y%

        IF NOT (px% < 0 OR px% > MAPWIDTH - 1 OR py% < 0 OR py% > MAPHEIGHT - 1) THEN
            IF VisibilityMap(px%, py%) = 1 THEN
                PRINT CHR$(LevelMap(px%, py%));
            ELSE
                PRINT " "
            END IF
        ELSE
            PRINT " "
        END IF

        IF px% = ItsPlayer.x AND py% = ItsPlayer.y THEN
            COLOR 15, 0
            LOCATE y% + 1, x% + 1
            PRINT "@";
        END IF

    NEXT x%
NEXT y%

END SUB

SUB DrawRangedAttackDrawList

DIM i%, xdelta%, ydelta%, xpos%, ypos%, drawx%, drawy%
DIM halfwidth%, halfheight%

halfwidth% = TEXTSCREENWIDTH / 2
halfheight% = TEXTSCREENHEIGHT / 2

FOR i% = 1 TO RangedAttackListCount

    xpos% = RangedAttackXList(i%)
    ypos% = RangedAttackYList(i%)

    IF NOT (xpos% = PlayerOne.x AND ypos% = PlayerOne.y) THEN

        xdelta% = xpos% - PlayerOne.x
        ydelta% = ypos% - PlayerOne.y

        IF ABS(xdelta%) <= TEXTSCREENWIDTH / 2 AND ABS(ydelta%) <= TEXTSCREENHEIGHT / 2 - 1 THEN
            IF VisibilityMap(xpos%, ypos%) = 1 THEN
                drawx% = halfwidth% + xdelta%
                drawy% = halfheight% + ydelta%
                LOCATE drawy% + 1, drawx% + 1
                COLOR 12, 0
                PRINT "*";
            END IF
        END IF

    END IF

NEXT i%

RangedAttackListCount = 0

END SUB

SUB DrawSpellListSelection

DIM i%
CLS
FOR i% = 1 TO LEN(PlayerOne.spelllist)
  
  IF ASC(MID$(PlayerOne.spelllist, i%, 1)) <> ASC("0") THEN
    SELECT CASE i%
      CASE 1
        PRINT CHR$(ASC("A") + i% - 1); ") Spark"
      CASE 2
        PRINT CHR$(ASC("B") + i% - 1); ") Heal"
      CASE ELSE
    END SELECT
  END IF
  
NEXT i%

END SUB

SUB DrawSpellTargetingCursor

DIM halfwidth%, halfheight%

halfwidth% = TEXTSCREENWIDTH / 2
halfheight% = TEXTSCREENHEIGHT / 2

COLOR 12, 0
LOCATE SpellTargetY + halfheight% + 1, SpellTargetX + halfwidth% + 1
PRINT "*"

LOCATE TEXTSCREENHEIGHT, 2
PRINT "Select target for spell..."

END SUB

SUB DropInventoryItem (index%, amount%)
DIM i%

PlayerInventory(index%).equipstatus = FALSE

IF PlayerInventory(index%).stackflag = 0 THEN
    AddMessage GetItemName(PlayerInventory(index%)) + " dropped..."
ELSE
    PlayerInventory(index%).stackcount = PlayerInventory(index%).stackcount - amount%
    IF PlayerInventory(index%).stackcount < 0 THEN
        amount% = amount% + PlayerInventory(index%).stackcount
        PlayerInventory(index%).stackcount = 0
    END IF
    AddMessage GetItemName(PlayerInventory(index%)) + " x " + LTRIM$(STR$(amount%)) + " dropped..."
END IF

FOR i% = 0 TO MAXITEMLISTLENGTH - 1
    IF ItemList(i%).id = 0 THEN
        ItemList(i%) = PlayerInventory(index%)
        ItemList(i%).x = PlayerOne.x
        ItemList(i%).y = PlayerOne.y
        IF ItemList(i%).stackflag = 1 THEN
            ItemList(i%).stackcount = amount%
        END IF
    
        IF i% > ItemListLength - 1 THEN
            ItemListLength = ItemListLength + 1
        END IF
    
        IF ItemList(i%).stackflag = 0 OR PlayerInventory(index%).stackcount <= 0 THEN
            PlayerInventory(index%).id = 0
        END IF
        EXIT FOR
    END IF
NEXT i%

SortInventory

END SUB

SUB EquipItem (index%)
DIM i%, samecount%

IF PlayerInventory(index%).equipstatus = FALSE THEN

    samecount% = 0

    FOR i% = 0 TO INVENTORYMAX - 1
        IF i% <> index% AND PlayerInventory(i%).id = PlayerInventory(index%).id THEN
            PlayerInventory(i%).equipstatus = FALSE
        END IF
    NEXT i%

    PlayerInventory(index%).equipstatus = TRUE
    AddMessage GetItemName(PlayerInventory(index%)) + " equipped..."

ELSEIF PlayerInventory(index%).equipstatus = TRUE THEN
    PlayerInventory(index%).equipstatus = FALSE
    AddMessage GetItemName(PlayerInventory(index%)) + " unequipped..."
END IF
END SUB

FUNCTION GetItemName$ (ItsItem AS Item)

SELECT CASE ItsItem.id
    CASE IDPOTION
        GetItemName$ = "Potion"
    CASE IDSWORD
        GetItemName$ = "Sword"
    CASE IDHELMET
        GetItemName$ = "Helmet"
    CASE IDSHIELD
        GetItemName$ = "Shield"
    CASE IDBODYARMOR
        GetItemName$ = "Body Armor"
    CASE IDGLOVES
        GetItemName$ = "Gloves"
    CASE IDGREAVES
        GetItemName$ = "Greaves"
    CASE IDHAMMER
        GetItemName$ = "Hammer"
    CASE IDNECKLACE
        GetItemName$ = "Necklace"
    CASE IDRING
        GetItemName$ = "Ring"
    CASE IDBOW
        GetItemName$ = "Bow"
    CASE ELSE
        GetItemName$ = "Nothing"
END SELECT


END FUNCTION

FUNCTION GetMonsterName$ (ItsMonster AS Monster)
GetMonsterName$ = LEFT$(ItsMonster.sname, INSTR(ItsMonster.sname, "`") - 1)
END FUNCTION

SUB GetPlayerOffenseDefense (offense%, defense%)
DIM i%

offense% = PlayerOne.strength / 2

IF offense% < 1 THEN offense% = 1
defense% = 0

FOR i% = 0 TO INVENTORYMAX - 1
    IF PlayerInventory(i%).id <> 0 AND PlayerInventory(i%).equipstatus = TRUE THEN
        SELECT CASE PlayerInventory(i%).id
            CASE IDSWORD
                offense% = offense% + 5
            CASE IDSHIELD
                defense% = defense% + 1
            CASE IDHELMET
                defense% = defense% + 1
            CASE IDBODYARMOR
                defense% = defense% + 1
            CASE IDGLOVES
                defense% = defense% + 1
            CASE IDGREAVES
                defense% = defense% + 1
            CASE IDHAMMER
                offense% = offense% + 6
            CASE IDNECKLACE
                defense% = defense% + 1
            CASE IDRING
                defense% = defense% + 1
            CASE IDBOW
                offense% = offense% + 5
            CASE ELSE
        END SELECT
    END IF
NEXT i%


END SUB

SUB GetSetStairsPosIndex (choice%, index%, xpos%, ypos%, stairstype%)
CONST MAXSTAIRS = 100
DIM x AS INTEGER, y AS INTEGER, ch%, index0%, breakflag%

IF choice% = 1 THEN
    '* * * get index of stairs based on x,y coordinates * * *

    index% = 0
    breakflag% = 0
    FOR y = 1 TO MAPHEIGHT - 2
        FOR x = 1 TO MAPWIDTH - 2
            ch% = LevelMap(x, y)
            IF ch% = stairstype% THEN
                index% = index% + 1
            END IF
            IF x = xpos% AND y = ypos% THEN
                breakflag% = 1
                EXIT FOR
            END IF
        NEXT x
        IF breakflag% = 1 THEN EXIT FOR
    NEXT y

ELSEIF choice% = 2 THEN
    '* * * set x,y position based on index of stairs * * *

    breakflag% = 0
    index0% = 0

    FOR y = 1 TO MAPHEIGHT - 2
        FOR x = 1 TO MAPWIDTH - 2
            ch% = LevelMap(x, y)
            IF ch% = stairstype% THEN
                index0% = index0% + 1
            END IF
            IF index0% = index% THEN
                xpos% = x
                ypos% = y
                breakflag% = 1
                EXIT FOR
            END IF
        NEXT x
        IF breakflag% = 1 THEN EXIT FOR
    NEXT y

    IF breakflag% = 0 THEN
        FOR y = 1 TO MAPHEIGHT - 2
            FOR x = 1 TO MAPWIDTH - 2
                ch% = LevelMap(x, y)
                IF ch% = stairstype% THEN
                    xpos% = x
                    ypos% = y
                    breakflag% = 1
                    EXIT FOR
                END IF
            NEXT x
            IF breakflag% = 1 THEN EXIT FOR
        NEXT y
    END IF

END IF

END SUB

SUB GetXYItem (px%, py%, ItsItemList() AS Item, ItsItemListLength%, returnitem AS Item)

DIM i%

FOR i% = 0 TO ItsItemListLength% - 1
    IF ItsItemList(i%).x = px% AND ItsItemList(i%).y = py% THEN
        returnitem = ItsItemList(i%)
        EXIT FOR
    END IF
NEXT i%

END SUB

SUB InitColorArray
    
'0 = black       4 = red           8 = grey             12 = light red
'1 = blue        5 = magenta       9 = light blue       13 = light magenta
'2 = green       6 = brown        10 = light green      14 = yellow
'3 = cyan        7 = white        11 = light cyan       15 = bright white

DIM i%

FOR i% = 0 TO 255
    ColorArray(i%) = 7
NEXT i%

ColorArray(ASC("!")) = 4
ColorArray(ASC("|")) = 9
ColorArray(ASC("%")) = 11
ColorArray(ASC("=")) = 14


END SUB

SUB InitItem (ItsItem AS Item)
'TYPE Item
'x AS INTEGER
'y AS INTEGER
'char AS INTEGER
'id AS INTEGER
'stackflag AS INTEGER
'stackcount AS INTEGER
'maxstacksize as integer
'canequipflag AS INTEGER
'equipstatus AS INTEGER
'END TYPE

DIM randvalue%

MapRandomEmptyXY 1, ItsItem.x, ItsItem.y
ItsItem.stackcount = 1
ItsItem.canequipflag = 0
ItsItem.equipstatus = FALSE

randvalue% = rand(1, 110)

'IDPOTION IDSWORD IDSHIELD IDHELMET IDBODYARMOR IDGLOVES IDGREAVES
'IDHAMMER IDNECKLACE IDRING IDBOW
SELECT CASE randvalue%

    CASE 1 TO 50
        '*** potion ***
        ItsItem.char = ASC("!")
        ItsItem.id = IDPOTION
        ItsItem.stackflag = 1
        ItsItem.maxstacksize = 10
    CASE 51 TO 55
        '*** sword ***
        ItsItem.char = ASC("|")
        ItsItem.id = IDSWORD
        ItsItem.stackflag = 0
        ItsItem.canequipflag = 1
    CASE 56 TO 60
        '*** shield ***
        ItsItem.char = ASC("%")
        ItsItem.id = IDSHIELD
        ItsItem.stackflag = 0
        ItsItem.canequipflag = 1
    CASE 61 TO 65
        '*** helmet ***
        ItsItem.char = ASC("%")
        ItsItem.id = IDHELMET
        ItsItem.stackflag = 0
        ItsItem.canequipflag = 1
    CASE 66 TO 70
        '*** body armor ***
        ItsItem.char = ASC("%")
        ItsItem.id = IDBODYARMOR
        ItsItem.stackflag = 0
        ItsItem.canequipflag = 1
    CASE 71 TO 75
        '*** gloves ***
        ItsItem.char = ASC("%")
        ItsItem.id = IDGLOVES
        ItsItem.stackflag = 0
        ItsItem.canequipflag = 1
    CASE 76 TO 80
        '*** greaves ***
        ItsItem.char = ASC("%")
        ItsItem.id = IDGREAVES
        ItsItem.stackflag = 0
        ItsItem.canequipflag = 1
    CASE 81 TO 85
        '*** hammer ***
        ItsItem.char = ASC("|")
        ItsItem.id = IDHAMMER
        ItsItem.stackflag = 0
        ItsItem.canequipflag = 1
    CASE 86 TO 90
        '*** necklace ***
        ItsItem.char = ASC("=")
        ItsItem.id = IDNECKLACE
        ItsItem.stackflag = 0
        ItsItem.canequipflag = 1
    CASE 91 TO 100
        '*** ring ***
        ItsItem.char = ASC("=")
        ItsItem.id = IDRING
        ItsItem.stackflag = 0
        ItsItem.canequipflag = 1
    CASE 100 TO 110
        '*** bow ***
        ItsItem.char = ASC("(")
        ItsItem.id = IDBOW
        ItsItem.stackflag = 0
        ItsItem.canequipflag = 1
    CASE ELSE
END SELECT

END SUB

FUNCTION InitItemList% (ItemList() AS Item, minitems%, maxitems%)
DIM i%, length%

length% = rand(minitems%, maxitems%)

'REDIM ItemList(0 TO length% - 1) as Item
REDIM ItemList(0 TO MAXITEMLISTLENGTH - 1) AS Item

FOR i% = 0 TO length% - 1
    InitItem ItemList(i%)
NEXT i%

InitItemList% = length%

END FUNCTION

SUB InitKeyCodeIndexArray

KeyCodeIndexArray(1) = KEYCODEA
KeyCodeIndexArray(2) = KEYCODEB
KeyCodeIndexArray(3) = KEYCODEC
KeyCodeIndexArray(4) = KEYCODED
KeyCodeIndexArray(5) = KEYCODEE

KeyCodeIndexArray(6) = KEYCODEF
KeyCodeIndexArray(7) = KEYCODEG
KeyCodeIndexArray(8) = KEYCODEH
KeyCodeIndexArray(9) = KEYCODEI
KeyCodeIndexArray(10) = KEYCODEJ

KeyCodeIndexArray(11) = KEYCODEK
KeyCodeIndexArray(12) = KEYCODEL
KeyCodeIndexArray(13) = KEYCODEM
KeyCodeIndexArray(14) = KEYCODEN
KeyCodeIndexArray(15) = KEYCODEO

KeyCodeIndexArray(16) = KEYCODEP
KeyCodeIndexArray(17) = KEYCODEQ
KeyCodeIndexArray(18) = KEYCODER
KeyCodeIndexArray(19) = KEYCODES
KeyCodeIndexArray(20) = KEYCODET

KeyCodeIndexArray(21) = KEYCODEU
KeyCodeIndexArray(22) = KEYCODEV
KeyCodeIndexArray(23) = KEYCODEW
KeyCodeIndexArray(24) = KEYCODEX
KeyCodeIndexArray(25) = KEYCODEY

KeyCodeIndexArray(26) = KEYCODEZ
KeyCodeIndexArray(27) = KEYCODEF1
KeyCodeIndexArray(28) = KEYCODEF2
KeyCodeIndexArray(29) = KEYCODEF3
KeyCodeIndexArray(30) = KEYCODEF4

KeyCodeIndexArray(31) = KEYCODEF5
KeyCodeIndexArray(32) = KEYCODEF6
KeyCodeIndexArray(34) = KEYCODEF7
KeyCodeIndexArray(35) = KEYCODEF8
KeyCodeIndexArray(36) = KEYCODEF9

KeyCodeIndexArray(37) = KEYCODEF10
KeyCodeIndexArray(38) = KEYCODEF11
KeyCodeIndexArray(39) = KEYCODEF12
KeyCodeIndexArray(40) = KEYCODE1
KeyCodeIndexArray(41) = KEYCODE2

KeyCodeIndexArray(42) = KEYCODE3
KeyCodeIndexArray(43) = KEYCODE4
KeyCodeIndexArray(44) = KEYCODE5
KeyCodeIndexArray(45) = KEYCODE6
KeyCodeIndexArray(47) = KEYCODE7
KeyCodeIndexArray(48) = KEYCODE8
KeyCodeIndexArray(49) = KEYCODE9
KeyCodeIndexArray(50) = KEYCODE10

END SUB

SUB InitLevelMap
DIM x AS INTEGER, y AS INTEGER

FOR y = 0 TO MAPHEIGHT - 1
    FOR x = 0 TO MAPWIDTH - 1
        LevelMap(x, y) = ASC(" ")
        VisibilityMap(x, y) = 0
    NEXT x
NEXT y

END SUB

FUNCTION LoadItemListFile%

DIM filename AS STRING
DIM dummy%, i%, listlength%

FileNotFoundFlag = 0

ON ERROR GOTO FileNotFoundError

filename = "items" + LTRIM$(STR$(PlayerOne.floor)) + ".txt"
OPEN filename FOR INPUT AS #1

IF LOF(1) = 0 THEN
    CLOSE #1
    LoadItemListFile% = FileNotFoundFlag
    EXIT FUNCTION
END IF

INPUT #1, dummy%, listlength%

ItemListLength = listlength%
REDIM ItemList(0 TO listlength% - 1) AS Item

FOR i% = 0 TO listlength% - 1
    INPUT #1, ItemList(i%).x, ItemList(i%).y
    INPUT #1, ItemList(i%).char
    INPUT #1, ItemList(i%).id
    INPUT #1, ItemList(i%).stackflag
    INPUT #1, ItemList(i%).stackcount
    INPUT #1, ItemList(i%).maxstacksize
    INPUT #1, ItemList(i%).canequipflag
    INPUT #1, ItemList(i%).equipstatus
NEXT i%

CLOSE #1

LoadItemListFile% = FileNotFoundFlag

END FUNCTION

FUNCTION LoadLevelMapFile%
DIM x%, y%, tempstr$, dummy%
DIM mapline AS STRING * MAPWIDTH

FileNotFoundFlag = 0

ON ERROR GOTO FileNotFoundError

OPEN "floor" + LTRIM$(STR$(PlayerOne.floor)) + ".txt" FOR INPUT AS #1

IF LOF(1) = 0 THEN
    CLOSE #1
    LoadLevelMapFile% = FileNotFoundFlag
    EXIT FUNCTION
END IF
        
FOR y% = 0 TO MAPHEIGHT - 1
    IF EOF(1) THEN EXIT FOR
    LINE INPUT #1, mapline

    FOR x% = 0 TO MAPWIDTH - 1
        LevelMap(x%, y%) = ASC(MID$(mapline, x% + 1, 1))
        VisibilityMap(x%, y%) = 0
    NEXT x%
NEXT y%

CLOSE #1
LoadLevelMapFile% = FileNotFoundFlag

END FUNCTION

FUNCTION LoadMonsterDataFile%

DIM filename AS STRING
DIM dummy%, i%, listlength%
DIM tempmonster AS Monster

FileNotFoundFlag = 0

ON ERROR GOTO FileNotFoundError

filename = "mons" + LTRIM$(STR$(PlayerOne.floor)) + ".txt"
OPEN filename FOR INPUT AS #1

IF LOF(1) = 0 THEN
    CLOSE #1
    LoadMonsterDataFile% = FileNotFoundFlag
    EXIT FUNCTION
END IF

INPUT #1, dummy%, listlength%

MonsterListLength = listlength%
REDIM MonsterList(0 TO listlength% - 1) AS Monster

FOR i% = 0 TO listlength% - 1
    INPUT #1, tempmonster.arrayindex
    INPUT #1, tempmonster.id
    INPUT #1, tempmonster.statusflag
    INPUT #1, tempmonster.x, tempmonster.y
    INPUT #1, tempmonster.hitpoints
    INPUT #1, tempmonster.statuslist

    MonsterList(i%) = UniqueMonsterTable(tempmonster.id)
    MonsterList(i%).arrayindex = tempmonster.arrayindex
    MonsterList(i%).statusflag = tempmonster.statusflag
    MonsterList(i%).x = tempmonster.x
    MonsterList(i%).y = tempmonster.y
    MonsterList(i%).hitpoints = tempmonster.hitpoints
    MonsterList(i%).statuslist = tempmonster.statuslist
NEXT i%

CLOSE #1

LoadMonsterDataFile% = FileNotFoundFlag

END FUNCTION

FUNCTION LoadMonsterTable%

LoadMonsterTable% = 0
OPEN "mnstbl.txt" FOR INPUT AS #1

FileNotFoundFlag = 0
ON ERROR GOTO FileNotFoundError

IF LOF(1) = 0 THEN
    CLOSE #1
    LoadMonsterTable% = FileNotFoundFlag
    EXIT FUNCTION
END IF

DIM tempstr$, textpos%, textlen%, tempstr2$
DIM tempmonster AS Monster

UniqueMonsterTableLength = 0

WHILE NOT EOF(1)

    INPUT #1, tempstr$
    textlen% = LEN(tempstr$)

    IF textlen% >= 2 THEN
        textpos% = INSTR(1, tempstr$, ";")

        IF textpos% >= 1 THEN
            tempstr$ = LEFT$(tempstr$, textpos% - 1)
            textlen% = LEN(tempstr$)
        END IF

        textpos% = INSTR(1, tempstr$, "id:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("id:"))
            tempmonster.id = VAL(LTRIM$(RTRIM$(tempstr2$)))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "level:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("level:"))
            tempmonster.level = VAL(LTRIM$(RTRIM$(tempstr2$)))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "strength:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("strength:"))
            tempmonster.strength = VAL(LTRIM$(RTRIM$(tempstr2$)))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "speed:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("speed:"))
            tempmonster.speed = VAL(LTRIM$(RTRIM$(tempstr2$)))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "intel:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("intel:"))
            tempmonster.intelligence = VAL(LTRIM$(RTRIM$(tempstr2$)))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "zeal:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("zeal:"))
            tempmonster.zeal = VAL(LTRIM$(RTRIM$(tempstr2$)))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "char:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("char:"))
            tempmonster.char = ASC(LTRIM$(RTRIM$(tempstr2$)))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "hp:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("hp:"))
            tempmonster.hitpoints = VAL(LTRIM$(RTRIM$(tempstr2$)))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "radardist:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("radardist:"))
            tempmonster.radardistance = VAL(LTRIM$(RTRIM$(tempstr2$)))
            GOTO whileend1
        END IF
        
        textpos% = INSTR(1, tempstr$, "statuslist:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("statuslist:"))
            tempmonster.statuslist = LTRIM$(RTRIM$(tempstr2$))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "attack:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("attack:"))
            tempmonster.attack = LTRIM$(RTRIM$(tempstr2$))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "attrib:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("attrib:"))
            tempmonster.attrib = LTRIM$(RTRIM$(tempstr2$))
            GOTO whileend1
        END IF

        textpos% = INSTR(1, tempstr$, "name:")
        IF textpos% >= 1 THEN
            tempstr2$ = MID$(tempstr$, textpos% + LEN("name:"))
            tempmonster.sname = LTRIM$(RTRIM$(tempstr2$))

            UniqueMonsterTableLength = UniqueMonsterTableLength + 1
            UniqueMonsterTable(tempmonster.id) = tempmonster
            GOTO whileend1
        END IF

    END IF

whileend1:
WEND

CLOSE #1

END FUNCTION

FUNCTION LoadPlayerDataFile%
DIM dummy%, i%, inventorycount%

FileNotFoundFlag = 0

ON ERROR GOTO FileNotFoundError

OPEN "player.txt" FOR INPUT AS #1

IF LOF(1) = 0 THEN
    CLOSE #1
    LoadPlayerDataFile% = FileNotFoundFlag
    EXIT FUNCTION
END IF


INPUT #1, dummy%, PlayerOne.x, PlayerOne.y
INPUT #1, dummy%, PlayerOne.floor
INPUT #1, dummy%, PlayerOne.hitpoints
INPUT #1, dummy%, PlayerOne.class
INPUT #1, dummy%, PlayerOne.level
INPUT #1, dummy%, PlayerOne.strength
INPUT #1, dummy%, PlayerOne.speed
INPUT #1, dummy%, PlayerOne.intelligence
INPUT #1, dummy%, PlayerOne.zeal
INPUT #1, dummy%, PlayerOne.statuslist
INPUT #1, dummy%, PlayerOne.spelllist
INPUT #1, dummy%, inventorycount%

REDIM PlayerInventory(0 TO INVENTORYMAX - 1) AS Item

FOR i% = 0 TO inventorycount% - 1
    INPUT #1, PlayerInventory(i%).x
    INPUT #1, PlayerInventory(i%).y
    INPUT #1, PlayerInventory(i%).char
    INPUT #1, PlayerInventory(i%).id
    INPUT #1, PlayerInventory(i%).stackflag
    INPUT #1, PlayerInventory(i%).stackcount
    INPUT #1, PlayerInventory(i%).maxstacksize
    INPUT #1, PlayerInventory(i%).canequipflag
    INPUT #1, PlayerInventory(i%).equipstatus
NEXT i%

CLOSE #1

LoadPlayerDataFile% = FileNotFoundFlag

END FUNCTION

SUB MapRandomEmptyXY (choice AS INTEGER, xpos AS INTEGER, ypos AS INTEGER)

STATIC xposlist() AS INTEGER
STATIC yposlist() AS INTEGER
STATIC listlength AS INTEGER
DIM randvalue%

IF choice = 0 OR listlength = 0 THEN

    REDIM xposlist(0 TO MAPWIDTH * MAPHEIGHT) AS INTEGER
    REDIM yposlist(0 TO MAPWIDTH * MAPHEIGHT) AS INTEGER
    listlength = 0

    FOR y = 1 TO MAPHEIGHT - 2
        FOR x = 1 TO MAPWIDTH - 2
            IF LevelMap(x, y) = ASC(".") THEN
                xposlist(listlength) = x
                yposlist(listlength) = y
                listlength = listlength + 1
            END IF
        NEXT x
    NEXT y
END IF

IF choice = 1 THEN

    randvalue% = rand(0, listlength - 1)
    xpos = xposlist(randvalue%)
    ypos = yposlist(randvalue%)

END IF

END SUB

SUB MonsterAttackPlayer (ItsMonster AS Monster, ItsPlayer AS Player)

DIM xdelta%, ydelta%, playeroffense%, playerdefense%, damage%
DIM attackname$, attackpower%, attackrange%
DIM monsteroffensivepower%, okayflag%
DIM xlist%(1 TO 100)
DIM ylist%(1 TO 100)
DIM distance%

xdelta% = ItsMonster.x - ItsPlayer.x
ydelta% = ItsMonster.y - ItsPlayer.y

ChooseMonsterAttack ItsMonster, attackname$, attackpower%, attackrange%

IF attackrange% > 1 THEN
    IF CheckStraightPathBlocked%(ItsMonster.x, ItsMonster.y, ItsPlayer.x, ItsPlayer.y, xlist%(), ylist%(), distance%) = 0 THEN
        okayflag% = 1
    END IF
ELSE
    okayflag% = 1
END IF

IF ABS(xdelta%) <= attackrange% AND ABS(ydelta%) <= attackrange% AND okayflag% > 0 THEN

    GetPlayerOffenseDefense playeroffense%, playerdefense%

    damage% = attackpower%
    monsteroffensivepower% = ItsMonster.strength / 4 + ItsMonster.speed / 4
    monsteroffensivepower% = monsteroffensivepower% - playerdefense%

    IF monsteroffensivepower% < 1 THEN monsteroffensivepower% = 1

    IF rand(1, playerdefense%) = 1 THEN
        '***null statement***
    ELSE
        damage% = 0
    END IF

    AddMessage GetMonsterName(ItsMonster) + STR$(ItsMonster.arrayindex) + " attacks you with " + attackname$ + " for " + LTRIM$(STR$(damage%)) + " damage!"
    ItsPlayer.hitpoints = ItsPlayer.hitpoints - damage%

    '***draw ranged attack***

    IF attackrange% > 1 THEN
        Add2RangedAttackDrawList xlist%(), ylist%(), distance%
    END IF

END IF



END SUB

SUB MonsterInit (arrayindex%, ItsMonster AS Monster, choice%)

DIM id%

id% = rand(1, UniqueMonsterTableLength)
ItsMonster = UniqueMonsterTable(id%)

MapRandomEmptyXY 1, ItsMonster.x, ItsMonster.y
'ItsMonster.char = ASC("M")
'ItsMonster.hitpoints = 10
ItsMonster.arrayindex = arrayindex%
ItsMonster.statusflag = STATUSNORMAL
ItsMonster.statuslist = "0000000000"

END SUB

FUNCTION MonsterInitList% (MonsterList() AS Monster, minpopulation%, maxpopulation%)

DIM length AS INTEGER
length = rand(minpopulation%, maxpopulation%)
MonsterInitList% = length
REDIM MonsterList(0 TO length - 1) AS Monster
DIM i AS INTEGER

MapRandomEmptyXY 0, MonsterList(0).x, MonsterList(0).y

FOR i = 0 TO length - 1
    MonsterInit i, MonsterList(i), 0

NEXT i
END FUNCTION

SUB PickUpItem (ItsPlayer AS Player, ItsInventory() AS Item, ItsItemList() AS Item, ItsItemListLength%)

'TYPE Item
'x AS INTEGER
'y AS INTEGER
'char AS INTEGER
'id AS INTEGER
'stackflag AS INTEGER
'stackcount AS INTEGER
'maxstacksize AS INTEGER
'END TYPE

DIM i%, k%, inventoryfullflag%, successflag%, msg$

FOR i% = 0 TO ItsItemListLength% - 1
    IF ItsItemList(i%).id <> 0 THEN
        IF ItsItemList(i%).x = ItsPlayer.x AND ItsItemList(i%).y = ItsPlayer.y THEN
            IF ItsItemList(i%).stackflag = 1 THEN
                FOR k% = 0 TO INVENTORYMAX - 1
                    IF ItsInventory(k%).id = ItsItemList(i%).id THEN
                        IF ItsInventory(k%).stackcount + ItsItemList(i%).stackcount <= ItsInventory(k%).maxstacksize THEN
                            ItsInventory(k%).stackcount = ItsInventory(k%).stackcount + ItsItemList(i%).stackcount
                            ItsItemList(i%).id = 0
                            successflag% = 1
                            EXIT FOR
                        END IF
                    END IF
                NEXT k%

                IF successflag% = 0 THEN
                    FOR k% = 0 TO INVENTORYMAX - 1
                        IF ItsInventory(k%).id = 0 THEN
                            ItsInventory(k%) = ItsItemList(i%)
                            ItsItemList(i%).id = 0
                            successflag% = 1
                            EXIT FOR
                        END IF
                        inventoryfullflag% = 1
                    NEXT k%

                END IF
            ELSE
                FOR k% = 0 TO INVENTORYMAX - 1
                    IF ItsInventory(k%).id = 0 THEN
                        ItsInventory(k%) = ItsItemList(i%)
                        ItsItemList(i%).id = 0
                        inventoryfullflag% = 0
                        successflag% = 1
                        EXIT FOR
                    END IF
                    inventoryfullflag% = 1
                NEXT k%

            END IF
            EXIT FOR
        END IF
    END IF

    IF successflag% = 1 OR inventoryfullflag% = 1 THEN EXIT FOR

NEXT i%

IF successflag% = 1 THEN
    msg$ = "Picked up " + GetItemName$(ItsInventory(k%))
    IF ItsItemList(i%).stackcount > 1 THEN
        msg$ = msg$ + " x " + LTRIM$(STR$(ItsInventory(k%).stackcount))
    END IF
    AddMessage msg$
    SortInventory
ELSEIF inventoryfullflag% = 1 THEN
    AddMessage "Inventory full!"
END IF

END SUB

SUB PlayerAttackMonster (ItsPlayer AS Player, ItsMonster AS Monster)

DIM xdelta%, ydelta%, offense%, defense%, damage%

'* * * melee attack * * *
'xdelta% = ItsMonster.x - ItsPlayer.x
'ydelta% = ItsMonster.y - ItsPlayer.y

'IF ABS(xdelta%) <= 1 AND ABS(ydelta%) <= 1 THEN
damage% = 0
GetPlayerOffenseDefense offense%, defense%
damage% = damage% + offense%
AddMessage "You attack " + GetMonsterName(ItsMonster) + STR$(ItsMonster.arrayindex) + " for " + LTRIM$(STR$(damage%)) + " damage."
ItsMonster.hitpoints = ItsMonster.hitpoints - damage%
IF ItsMonster.hitpoints <= 0 THEN ItsMonster.statusflag = STATUSDEAD
'END IF

END SUB

FUNCTION PlayerFireRangedWeapon%

DIM i%, xlist%(100), ylist%(100), distance%, xdest%, ydest%
DIM okayflag%

okayflag% = 0

FOR i% = 0 TO INVENTORYMAX - 1
    IF PlayerInventory(i%).id = IDBOW AND PlayerInventory(i%).equipstatus = TRUE THEN
        okayflag% = 1
        EXIT FOR
    END IF
NEXT i%


IF okayflag% = 0 THEN
    PlayerFireRangedWeapon% = 0
    EXIT FUNCTION
END IF

PlayerFireRangedWeapon% = -1

'AddMessage STR$(PlayerFireRangedWeaponTargetX) + "," + STR$(PlayerFireRangedWeaponTargetY)
FOR i% = 0 TO MonsterListLength - 1

    IF MonsterList(i%).statusflag <> STATUSDEAD THEN
        xdest% = PlayerFireRangedWeaponTargetX + PlayerOne.x
        ydest% = PlayerFireRangedWeaponTargetY + PlayerOne.y

        IF MonsterList(i%).x = xdest% AND MonsterList(i%).y = ydest% THEN

            IF CheckStraightPathBlocked%(PlayerOne.x, PlayerOne.y, xdest%, ydest%, xlist%(), ylist%(), distance%) = 0 THEN
                Add2RangedAttackDrawList xlist%(), ylist%(), distance%
                PlayerFireRangedWeapon% = 1
                PlayerAttackMonster PlayerOne, MonsterList(i%)
            ELSE
                '***null statement***
            END IF

            EXIT FOR

        END IF
    END IF
 
NEXT i%


END FUNCTION

SUB PlayerInit (ItsPlayer AS Player, choice AS INTEGER)
DIM randchoice%, x%, y%, ch%, i%

IF choice = 0 THEN

    ItsPlayer.floor = 1
    ItsPlayer.hitpoints = 100

    ItsPlayer.class = 0
    ItsPlayer.level = 1
    ItsPlayer.strength = 10
    ItsPlayer.speed = 11
    ItsPlayer.intelligence = 12
    ItsPlayer.zeal = 13
    ItsPlayer.statuslist = STRING$(10, ASC("0"))
    ItsPlayer.spelllist = STRING$(50, ASC("0"))

    FOR i% = 0 TO INVENTORYMAX - 1
        PlayerInventory(i%).id = 0
    NEXT i%

ELSEIF choice = 1 THEN

    randchoice% = rand(1, 4)

    SELECT CASE randchoice%
        CASE 1
            ' top
            FOR y% = 1 TO MAPHEIGHT - 2
                FOR x% = 1 TO MAPWIDTH - 2
                    ch% = LevelMap(x%, y%)
                    IF ch% = ASC(".") THEN
                        ItsPlayer.x = x%
                        ItsPlayer.y = y%
                    END IF
                NEXT x%
            NEXT y%
        CASE 2
            ' right
            FOR x% = MAPWIDTH - 2 TO 1 STEP -1
                FOR y% = 1 TO MAPHEIGHT - 2
                    ch% = LevelMap(x%, y%)
                    IF ch% = ASC(".") THEN
                        ItsPlayer.x = x%
                        ItsPlayer.y = y%
                    END IF
                NEXT y%
            NEXT x%
        CASE 3
            ' down
            FOR y% = MAPHEIGHT - 2 TO 1 STEP -1
                FOR x% = 1 TO MAPWIDTH - 2
                    ch% = LevelMap(x%, y%)
                    IF ch% = ASC(".") THEN
                        ItsPlayer.x = x%
                        ItsPlayer.y = y%
                    END IF
                NEXT x%
            NEXT y%

        CASE 4
            ' left
            FOR x% = 1 TO MAPWIDTH - 2
                FOR y% = 1 TO MAPHEIGHT - 2
                    ch% = LevelMap(x%, y%)
                    IF ch% = ASC(".") THEN
                        ItsPlayer.x = x%
                        ItsPlayer.y = y%
                    END IF
                NEXT y%
            NEXT x%

        CASE ELSE
    END SELECT

END IF

END SUB

FUNCTION PlayerInput (ItsPlayer AS Player)
DIM refreshflag%, showinventoryrefreshflag%, showplayerstatusrefreshflag%
DIM ItsMonster AS Monster

STATIC InputDelayCounter() AS SINGLE
STATIC InputDelayCounterInitFlag AS INTEGER
STATIC DropItemIndex AS INTEGER

CONST MAXDELAYCOUNTERS = 6
CONST CHANGELEVELDELAY = .5
CONST SHOWINVENTORYDELAY = .5
CONST EQUIPSCREENDELAY = .5
CONST PICKUPITEMDELAY = .5
CONST SEARCHDELAY = .5
CONST MOVEDELAY = .2

DIM px%, py%, moveflag%, ch%, playerxold%, playeryold%
DIM index%, dummy%, i%


IF InputDelayCounterInitFlag = 0 THEN
  REDIM InputDelayCounter(1 TO MAXDELAYCOUNTERS) AS SINGLE
  InputDelayCounterInitFlag = 1
END IF

px% = ItsPlayer.x: py% = ItsPlayer.y
playerxold% = px%: playeryold% = py%

moveflag% = 0
PlayerInput = 0

IF EquipmentSelectionStatus = 1 THEN
    index% = -1
    
    FOR i% = 1 TO 26
      IF ScanKey(KeyCodeIndexArray(i%)) THEN
        index% = i% - 1
        EXIT FOR
      END IF
    NEXT i%

    IF 0 <= index% AND index% <= 25 THEN
        IF TIMER - InputDelayCounter(3) >= EQUIPSCREENDELAY THEN
        
            FOR i% = 1 TO MAXDELAYCOUNTERS
              InputDelayCounter(i%) = TIMER
            NEXT i%

            IF DropItemFlag = 1 THEN

                EquipmentSelectionStatus = 0
                DropItemFlag = 0

                IF index% < 0 OR index% > INVENTORYMAX - 1 THEN
                    AddMessage "Nothing dropped..."
                ELSEIF PlayerInventory(index%).id = 0 THEN
                    AddMessage "Nothing dropped..."
                ELSEIF PlayerInventory(index%).id <> 0 THEN
                    IF PlayerInventory(index%).stackflag = 1 THEN
                        DropItemFlag = 2
                        EquipmentSelectionStatus = 1
                        DropItemIndex = index%
                        ShowAmountSelection
                    ELSE
                        DropInventoryItem index%, 1
                    END IF
                ELSE
                    AddMessage "Nothing dropped..."
                END IF

            ELSEIF DropItemFlag = 2 THEN
                DropItemFlag = 0
                EquipmentSelectionStatus = 0
                IF index% < 0 OR index% > INVENTORYMAX - 1 THEN
                    AddMessage "Invalid amount..."
                ELSE
                    DropInventoryItem DropItemIndex, index% + 1
                END IF
            ELSEIF EquipItemFlag = 1 THEN
                IF index% < 0 OR index% > INVENTORYMAX - 1 THEN
                    EquipmentSelectionStatus = 0
                    AddMessage "Nothing equipped..."
                ELSEIF PlayerInventory(index%).id = 0 THEN
                    EquipmentSelectionStatus = 0
                    AddMessage "Nothing equipped..."
                ELSEIF PlayerInventory(index%).canequipflag = 1 THEN
                    EquipItem index%
                    EquipmentSelectionStatus = 0
                ELSE
                    EquipmentSelectionStatus = 0
                    AddMessage "Nothing equipped..."
                END IF
                EquipItemFlag = 0

            ELSEIF UseItemFlag = 1 THEN
                IF index% < 0 OR index% > INVENTORYMAX - 1 THEN
                    EquipmentSelectionStatus = 0
                    AddMessage "Nothing used..."
                ELSEIF PlayerInventory(index%).id = 0 THEN
                    EquipmentSelectionStatus = 0
                    AddMessage "Nothing used..."
                ELSE
                    EquipmentSelectionStatus = 0
                    UseInventoryItem index%
                END IF
                UseItemFlag = 0

            END IF

            IF EquipmentSelectionStatus = 0 THEN
                refreshflag% = 1
            END IF

        END IF
    END IF

    dummy% = ScanKey(0)

ELSEIF PlayerFireRangedWeaponFlag = 0 AND ScanKey(KEYCODEF) AND PlayerCastSpellFlag = 0 THEN

    IF TIMER - InputDelayCounter(6) >= MOVEDELAY THEN
        InputDelayCounter(6) = TIMER
        refreshflag% = 2

        PlayerFireRangedWeaponFlag = 1
        PlayerFireRangedWeaponTargetX = 0
        PlayerFireRangedWeaponTargetY = 0

        dummy% = ScanKey(0)

    END IF

ELSEIF PlayerFireRangedWeaponFlag = 1 THEN

    IF TIMER - InputDelayCounter(6) >= MOVEDELAY THEN

        IF ScanKey(KEYCODEUP) THEN
            InputDelayCounter(6) = TIMER
            PlayerFireRangedWeaponTargetY = PlayerFireRangedWeaponTargetY - 1
            refreshflag% = 2
            dummy% = ScanKey(0)
        ELSEIF ScanKey(KEYCODEDOWN) THEN
            InputDelayCounter(6) = TIMER
            PlayerFireRangedWeaponTargetY = PlayerFireRangedWeaponTargetY + 1
            refreshflag% = 2
            dummy% = ScanKey(0)
        ELSEIF ScanKey(KEYCODELEFT) THEN
            InputDelayCounter(6) = TIMER
            PlayerFireRangedWeaponTargetX = PlayerFireRangedWeaponTargetX - 1
            refreshflag% = 2
            dummy% = ScanKey(0)
        ELSEIF ScanKey(KEYCODERIGHT) THEN
            InputDelayCounter(6) = TIMER
            PlayerFireRangedWeaponTargetX = PlayerFireRangedWeaponTargetX + 1
            refreshflag% = 2
            dummy% = ScanKey(0)
        ELSEIF ScanKey(KEYCODEF) THEN

            SELECT CASE PlayerFireRangedWeapon
                CASE -1
                    AddMessage "You missed!"
                CASE 0
                    AddMessage "No ranged weapon equipped!"
                CASE 1
                    '***null statement***
                CASE ELSE
            END SELECT

            InputDelayCounter(6) = TIMER
            refreshflag% = 1
            PlayerFireRangedWeaponFlag = 0
            dummy% = ScanKey(0)
        END IF

        IF PlayerFireRangedWeaponTargetX < -TEXTSCREENWIDTH / 2 THEN PlayerFireRangedWeaponTargetX = -TEXTSCREENWIDTH / 2
        IF PlayerFireRangedWeaponTargetX > TEXTSCREENWIDTH / 2 THEN PlayerFireRangedWeaponTargetX = TEXTSCREENWIDTH / 2
        IF PlayerFireRangedWeaponTargetY < -TEXTSCREENHEIGHT / 2 THEN PlayerFireRangedWeaponTargetY = -TEXTSCREENHEIGHT / 2
        IF PlayerFireRangedWeaponTargetY > TEXTSCREENHEIGHT / 2 THEN PlayerFireRangedWeaponTargetY = TEXTSCREENHEIGHT / 2

    END IF

ELSEIF PlayerCastSpellFlag = 0 AND ScanKey(KEYCODEP) THEN

  IF TIMER - InputDelayCounter(6) >= MOVEDELAY THEN
     InputDelayCounter(6) = TIMER
     refreshflag% = 2
     PlayerCastSpellFlag = 1
  END IF
      
ELSEIF PlayerCastSpellFlag = 1 THEN
'*** spell selection          
                             
 IF TIMER - InputDelayCounter(6) >= MOVEDELAY THEN
    
    index% = -1
                           
    FOR i% = 1 TO 26
      IF ScanKey(KeyCodeIndexArray(i%)) THEN
        index% = i% - 1
        EXIT FOR
      END IF
    NEXT i%
                                
    IF 0 <= index% AND index% <= 25 THEN
      InputDelayCounter(6) = TIMER
      SpellTargetX = -1: SpellTargetY = -1
                            
      dummy% = PlayerUseSpell(index%, SpellTargetX, SpellTargetY)
       
      IF dummy% = -1 THEN
        PlayerCastSpellFlag = 2
        refreshflag% = 2
        
      ELSEIF dummy% = 0 THEN
        PlayerCastSpellFlag = 0
      END IF
      
      SpellSelectionIndex = index%
      dummy% = ScanKey(0)

    END IF
   
 END IF
     
ELSEIF PlayerCastSpellFlag = 2 THEN
'*** ranged spell targeting

  IF TIMER - InputDelayCounter(6) >= MOVEDELAY THEN
  
        IF ScanKey(KEYCODEUP) THEN
            InputDelayCounter(6) = TIMER
            SpellTargetY = SpellTargetY - 1
            refreshflag% = 2
            dummy% = ScanKey(0)
        ELSEIF ScanKey(KEYCODEDOWN) THEN
            InputDelayCounter(6) = TIMER
            SpellTargetY = SpellTargetY + 1
            refreshflag% = 2
            dummy% = ScanKey(0)
        ELSEIF ScanKey(KEYCODELEFT) THEN
            InputDelayCounter(6) = TIMER
            SpellTargetX = SpellTargetX - 1
            refreshflag% = 2
            dummy% = ScanKey(0)
        ELSEIF ScanKey(KEYCODERIGHT) THEN
            InputDelayCounter(6) = TIMER
            SpellTargetX = SpellTargetX + 1
            refreshflag% = 2
            dummy% = ScanKey(0)
        ELSEIF ScanKey(KEYCODEP) THEN

           dummy% = PlayerUseSpell(SpellSelectionIndex, SpellTargetX, SpellTargetY)
           
           InputDelayCounter(6) = TIMER
           refreshflag% = 2
           PlayerCastSpellFlag = 0
           dummy% = ScanKey(0)
           
        IF SpellTargetX < -TEXTSCREENWIDTH / 2 THEN SpellTargetX = -TEXTSCREENWIDTH / 2
        IF SpellTargetX > TEXTSCREENWIDTH / 2 THEN SpellTargetX = TEXTSCREENWIDTH / 2
        IF SpellTargetY < -TEXTSCREENHEIGHT / 2 THEN SpellTargetY = -TEXTSCREENHEIGHT / 2
        IF SpellTargetY > TEXTSCREENHEIGHT / 2 THEN SpellTargetY = TEXTSCREENHEIGHT / 2
        END IF
  END IF
  
ELSEIF ScanKey(KEYCODEE) AND EquipmentSelectionStatus = 0 THEN
    IF TIMER - InputDelayCounter(3) >= EQUIPSCREENDELAY THEN
        InputDelayCounter(3) = TIMER
        EquipmentSelectionStatus = 1
        ShowInventory
        LOCATE TEXTSCREENHEIGHT - 1, 1
        PRINT "Select item to equip...";
        EquipItemFlag = 1
        dummy% = ScanKey(0)
    END IF

ELSEIF ScanKey(KEYCODED) AND EquipmentSelectionStatus = 0 THEN
    IF TIMER - InputDelayCounter(3) >= EQUIPSCREENDELAY THEN
        InputDelayCounter(3) = TIMER
        EquipmentSelectionStatus = 1
        ShowInventory
        LOCATE TEXTSCREENHEIGHT - 1, 1
        PRINT "Select item to drop...";
        DropItemFlag = 1
        dummy% = ScanKey(0)
    END IF

ELSEIF ScanKey(KEYCODEU) AND EquipmentSelectionStatus = 0 THEN
    IF TIMER - InputDelayCounter(3) >= EQUIPSCREENDELAY THEN
        InputDelayCounter(3) = TIMER
        EquipmentSelectionStatus = 1
        ShowInventory
        LOCATE TEXTSCREENHEIGHT - 1, 1
        PRINT "Select item to use...";
        UseItemFlag = 1
        dummy% = ScanKey(0)
    END IF

ELSEIF ScanKey(KEYCODEESC) THEN
    IF TIMER - InputDelayCounter(6) >= MOVEDELAY THEN
        InputDelayCounter(6) = TIMER
        PlayerInput = 1
    END IF
ELSEIF ScanKey(KEYCODEUP) THEN
    IF TIMER - InputDelayCounter(6) >= MOVEDELAY THEN
        InputDelayCounter(6) = TIMER
        py% = py% - 1
        moveflag% = 1
    END IF
ELSEIF ScanKey(KEYCODEDOWN) THEN
    IF TIMER - InputDelayCounter(6) >= MOVEDELAY THEN
        InputDelayCounter(6) = TIMER
        py% = py% + 1
        moveflag% = 1
    END IF
ELSEIF ScanKey(KEYCODELEFT) THEN
    IF TIMER - InputDelayCounter(6) >= MOVEDELAY THEN
        InputDelayCounter(6) = TIMER
        px% = px% - 1
        moveflag% = 1
    END IF
ELSEIF ScanKey(KEYCODERIGHT) THEN
    IF TIMER - InputDelayCounter(6) >= MOVEDELAY THEN
        InputDelayCounter(6) = TIMER
        px% = px% + 1
        moveflag% = 1
    END IF
ELSEIF ScanKey(KEYCODELEFTSHIFT) OR ScanKey(KEYCODERIGHTSHIFT) THEN

    IF TIMER - InputDelayCounter(1) >= CHANGELEVELDELAY THEN

        ch% = LevelMap(px%, py%)

        IF ScanKey(KEYCODECOMMA) AND ch% = ASC("<") THEN

            '* * * go up * * *
            ChangeFloor PlayerOne, -1
            refreshflag% = 1
            InputDelayCounter(1) = TIMER

        ELSEIF ScanKey(KEYCODEPERIOD) AND ch% = ASC(">") THEN
            ' * * * go down * * *
            ChangeFloor PlayerOne, 1
            refreshflag% = 1
            InputDelayCounter(1) = TIMER
        END IF

    END IF

ELSEIF ScanKey(KEYCODEG) THEN
    IF TIMER - InputDelayCounter(4) >= PICKUPITEMDELAY THEN
        InputDelayCounter(4) = TIMER
        PickUpItem PlayerOne, PlayerInventory(), ItemList(), ItemListLength
        refreshflag% = 1
        dummy% = ScanKey(0)
    END IF
ELSEIF ScanKey(KEYCODEI) THEN

    IF TIMER - InputDelayCounter(2) >= SHOWINVENTORYDELAY THEN
        ShowInventoryFlag = NOT ShowInventoryFlag
        InputDelayCounter(2) = TIMER

        IF NOT ShowInventoryFlag THEN
            refreshflag% = 1
        ELSE
            showinventoryrefreshflag% = 1
        END IF

        dummy% = ScanKey(0)
    END IF

ELSEIF ScanKey(KEYCODES) THEN
    IF TIMER - InputDelayCounter(5) >= SEARCHDELAY THEN
        InputDelayCounter(5) = TIMER
        DIM TempItem AS Item, tempstr$
        GetXYItem ItsPlayer.x, ItsPlayer.y, ItemList(), ItemListLength, TempItem
        tempstr$ = "You see " + GetItemName(TempItem)
        AddMessage tempstr$
        refreshflag% = 1
        dummy% = ScanKey(0)
    END IF

ELSEIF ScanKey(KEYCODEC) THEN

    IF TIMER - InputDelayCounter(2) >= SHOWINVENTORYDELAY THEN
        ShowPlayerStatusFlag = NOT ShowPlayerStatusFlag
        InputDelayCounter(2) = TIMER

        IF NOT ShowPlayerStatusFlag THEN
            refreshflag% = 1
        ELSE
            showplayerstatusrefreshflag% = 1
        END IF
        dummy% = ScanKey(0)
    END IF

END IF

'InputDelayCounter = InputDelayCounter + 1
'IF InputDelayCounter >= CHANGELEVELDELAY THEN InputDelayCounter = CHANGELEVELDELAY

'InputDelayCounter2 = InputDelayCounter2 + 1
'IF InputDelayCounter2 >= SHOWINVENTORYDELAY THEN InputDelayCounter2 = SHOWINVENTORYDELAY

'InputDelayCounter3 = InputDelayCounter3 + 1
'IF InputDelayCounter3 >= EQUIPSCREENDELAY THEN InputDelayCounter3 = EQUIPSCREENDELAY

'InputDelayCounter4 = InputDelayCounter4 + 1
'IF InputDelayCounter4 >= PICKUPITEMDELAY THEN InputDelayCounter4 = PICKUPITEMDELAY

'InputDelayCounter5 = InputDelayCounter5 + 1
'IF InputDelayCounter5 >= SEARCHDELAY THEN InputDelayCounter5 = SEARCHDELAY

IF moveflag% = 1 THEN
    IF NOT (px% < 0 OR px% > MAPWIDTH - 1 OR py% < 0 OR py% > MAPHEIGHT - 1) THEN
        ch% = LevelMap(px%, py%)

        IF ch% <> ASC(" ") AND ch% <> ASC("#") THEN
            ItsPlayer.x = px%: ItsPlayer.y = py%
            refreshflag% = 1
            px% = ScanKey(0)

            IF CheckCollidePlayerMonsterList(ItsPlayer, ItsMonster) = 1 THEN
                ItsPlayer.x = playerxold%
                ItsPlayer.y = playeryold%

                PlayerAttackMonster ItsPlayer, ItsMonster
                MonsterList(ItsMonster.arrayindex) = ItsMonster
            END IF
        END IF

    END IF
END IF

IF refreshflag% > 0 THEN

    IF refreshflag% = 1 THEN
        DoPlayerSight ItsPlayer
        DoMonsterList MonsterList(), MonsterListLength
    END IF

    DrawPlayerView ItsPlayer
    DrawPlayerStatus ItsPlayer
    DrawItemList ItemList(), ItemListLength, PlayerOne

    IF RangedAttackListCount >= 1 THEN
        DrawRangedAttackDrawList
    END IF

    DrawMonsterList MonsterList(), MonsterListLength, PlayerOne
    ShowMessage

    IF PlayerFireRangedWeaponFlag = 1 THEN
       DrawPlayerFireRangedWeaponTargetCursor
    ELSEIF PlayerCastSpellFlag = 1 THEN
       DrawSpellListSelection
    ELSEIF PlayerCastSpellFlag = 2 THEN
       DrawSpellTargetingCursor
    END IF
ELSEIF showinventoryrefreshflag% = 1 THEN
    ShowInventory
    showinventoryrefreshflag% = 0
ELSEIF showplayerstatusrefreshflag% = 1 THEN
    ShowPlayerStatus
    showplayerstatusrefreshflag% = 0
END IF

END FUNCTION

FUNCTION PlayerUseSpell% (spellindex%, targetx%, targety%)
'***check if spell is ranged
'***loop through global monster list and check if any monster is in or near target position
'***if spell is group targeting, save nearby enemy positions to array

targetx% = 0: targety% = 0
PlayerUseSpell% = -1

END FUNCTION

SUB PrintItemListFile (itsfloor%)
DIM filename AS STRING
DIM i%

filename = "items" + LTRIM$(STR$(itsfloor%)) + ".txt"
OPEN filename FOR OUTPUT AS #1

PRINT #1, "listlength"; ItemListLength

FOR i% = 0 TO ItemListLength - 1
    PRINT #1, ItemList(i%).x; ItemList(i%).y;
    PRINT #1, ItemList(i%).char;
    PRINT #1, ItemList(i%).id;
    PRINT #1, ItemList(i%).stackflag;
    PRINT #1, ItemList(i%).stackcount;
    PRINT #1, ItemList(i%).maxstacksize;
    PRINT #1, ItemList(i%).canequipflag;
    PRINT #1, ItemList(i%).equipstatus
NEXT i%

CLOSE #1

END SUB

SUB PrintLevelMapFile (itsfloor%)
DIM x%, y%
DIM mapline AS STRING * MAPWIDTH

OPEN "floor" + LTRIM$(STR$(itsfloor%)) + ".txt" FOR OUTPUT AS #1

FOR y% = 0 TO MAPHEIGHT - 1
    FOR x% = 0 TO MAPWIDTH - 1
        MID$(mapline, x% + 1, 1) = CHR$(LevelMap(x%, y%))
    NEXT x%
    PRINT #1, mapline
NEXT y%

CLOSE #1

END SUB

SUB PrintMapMonsterFile
DIM x AS INTEGER, y AS INTEGER, i AS INTEGER
DIM mapline AS STRING * TEXTSCREENWIDTH
DIM LevelMap0(0 TO MAPWIDTH - 1, 0 TO MAPHEIGHT - 1) AS INTEGER

FOR y = 0 TO MAPHEIGHT - 1
    FOR x = 0 TO MAPWIDTH - 1
        LevelMap0(x, y) = LevelMap(x, y)
        IF x = PlayerOne.x AND y = PlayerOne.y THEN
            LevelMap0(x, y) = ASC("@")
        END IF
    NEXT x
NEXT y

FOR i = 0 TO MonsterListLength - 1
    x = MonsterList(i).x
    y = MonsterList(i).y
    LevelMap0(x, y) = MonsterList(i).char

    IF x = PlayerOne.x AND y = PlayerOne.y THEN
        LevelMap0(x, y) = ASC("?")
    END IF

NEXT i

OPEN "fullview.txt" FOR OUTPUT AS #1

FOR y = 0 TO MAPHEIGHT - 1
    FOR x = 0 TO MAPWIDTH - 1
        MID$(mapline, x + 1, 1) = CHR$(LevelMap0(x, y))
    NEXT x
    PRINT #1, mapline
NEXT y

CLOSE #1


END SUB

SUB PrintMonsterListFile (itsfloor%)

'DIM SHARED MonsterList(10) AS Monster
'DIM SHARED MonsterListLength AS INTEGER
'TYPE Monster
'arrayindex as integer
'x AS INTEGER
'y AS INTEGER
'char AS INTEGER
'hitpoints AS INTEGER
'END TYPE

DIM filename AS STRING
DIM i%

filename = "mons" + LTRIM$(STR$(itsfloor%)) + ".txt"

OPEN filename FOR OUTPUT AS #1

PRINT #1, "listlength"; MonsterListLength
FOR i = 0 TO MonsterListLength
    PRINT #1, MonsterList(i).arrayindex;
    PRINT #1, MonsterList(i).id;
    PRINT #1, MonsterList(i).statusflag;
    PRINT #1, MonsterList(i).x; MonsterList(i).y;
    PRINT #1, MonsterList(i).hitpoints;
    PRINT #1, MonsterList(i).statuslist
NEXT i

CLOSE #1

END SUB

SUB PrintPlayerDataFile
DIM i%, inventorycount%

OPEN "player.txt" FOR OUTPUT AS #1
PRINT #1, "PLAYER_XY"; PlayerOne.x; PlayerOne.y
PRINT #1, "PLAYER_FLOOR"; PlayerOne.floor
PRINT #1, "PLAYER_HITPOINTS "; PlayerOne.hitpoints
PRINT #1, "PLAYER_CLASS"; PlayerOne.class
PRINT #1, "PLAYER_LEVEL"; PlayerOne.level
PRINT #1, "PLAYER_STRENGTH "; PlayerOne.strength
PRINT #1, "PLAYER_SPEED"; PlayerOne.speed
PRINT #1, "PLAYER_INTELLIGENCE"; PlayerOne.intelligence
PRINT #1, "PLAYER_ZEAL"; PlayerOne.zeal
PRINT #1, "PLAYER_STATUS "; PlayerOne.statuslist
PRINT #1, "PLAYER_SPELLS "; PlayerOne.spelllist

inventorycount% = 0

FOR i% = 0 TO INVENTORYMAX - 1
    IF PlayerInventory(i%).id <> 0 THEN
        inventorycount% = inventorycount% + 1
    END IF
NEXT i%

PRINT #1, "INVENTORY_COUNT"; inventorycount%

FOR i% = 0 TO INVENTORYMAX - 1
    IF PlayerInventory(i%).id <> 0 THEN
        PRINT #1, PlayerInventory(i%).x;
        PRINT #1, PlayerInventory(i%).y;
        PRINT #1, PlayerInventory(i%).char;
        PRINT #1, PlayerInventory(i%).id;
        PRINT #1, PlayerInventory(i%).stackflag;
        PRINT #1, PlayerInventory(i%).stackcount;
        PRINT #1, PlayerInventory(i%).maxstacksize;
        PRINT #1, PlayerInventory(i%).canequipflag;
        PRINT #1, PlayerInventory(i%).equipstatus
    END IF
NEXT i%

CLOSE #1

'TYPE Item
'x AS INTEGER
'y AS INTEGER
'char AS INTEGER
'id AS INTEGER
'stackflag AS INTEGER
'stackcount AS INTEGER
'maxstacksize AS INTEGER
'canequipflag AS INTEGER
'equipstatus AS INTEGER
'END TYPE
'CONST INVENTORYMAX = 20
'DIM SHARED PlayerInventory(0 TO INVENTORYMAX - 1) AS Item

END SUB

FUNCTION rand% (lowerbound%, upperbound%)

rand = INT((upperbound% - lowerbound% + 1) * RND + lowerbound%)

END FUNCTION

SUB SaveGame (saveplayerflag%, savemapflag%, savemonstersflag%, saveitemsflag%, itsfloor%)

IF saveplayerflag% = 1 THEN
    PrintPlayerDataFile
END IF

IF savemapflag% = 1 THEN
    PrintLevelMapFile itsfloor%
END IF

IF savemonstersflag% = 1 THEN
    PrintMonsterListFile itsfloor%
END IF

IF saveitemsflag% = 1 THEN
    PrintItemListFile itsfloor%
END IF

END SUB

FUNCTION ScanKey% (scancode%)
STATIC Ready%, keyflags%()
IF NOT Ready% THEN REDIM keyflags%(0 TO 127): Ready% = -1
i% = INP(&H60) 'read keyboard states
IF (i% AND 128) THEN keyflags%(i% XOR 128) = 0
IF (i% AND 128) = 0 THEN keyflags%(i%) = -1
k$ = INKEY$
ScanKey% = keyflags%(scancode%)
IF scancode% = 0 THEN Ready% = 0 'allows program to reset all values to 0 with a REDIM

END FUNCTION

SUB ShowAmountSelection
DIM i%

CLS

PRINT ""
FOR i% = 1 TO INVENTORYMAX
    PRINT CHR$(i% - 1 + ASC("A")); ") "; i%
NEXT i%

LOCATE TEXTSCREENHEIGHT - 1, 1
PRINT "Select amount...";

END SUB

SUB ShowInventory

DIM i%

CLS
COLOR 15, 0
PRINT "----- Inventory -----"
FOR i% = 0 TO INVENTORYMAX - 1
    IF PlayerInventory(i%).id <> 0 THEN
        PRINT CHR$(i% + ASC("A")); ") "; GetItemName(PlayerInventory(i%));
        IF PlayerInventory(i%).stackcount > 1 THEN
            PRINT " x"; PlayerInventory(i%).stackcount
        ELSEIF PlayerInventory(i%).equipstatus THEN
            PRINT " (E)"
        ELSE
            PRINT ""
        END IF
    END IF
NEXT i%

END SUB

SUB ShowMessage

'CONST MESSAGELISTMAX = 4
'DIM SHARED MessageList(1 to MESSAGELISTMAX) AS STRING

DIM i%
COLOR 15, 0
FOR i% = 1 TO MESSAGELISTMAX
    LOCATE TEXTSCREENHEIGHT - i%, 2
    PRINT MessageList(i%);
NEXT i%
 
FOR i% = MESSAGELISTMAX TO 2 STEP -1
    MessageList(i%) = MessageList(i% - 1)
NEXT i%
MessageList(i%) = ""
END SUB

SUB ShowPlayerStatus

'TYPE Player
'x AS INTEGER
'y AS INTEGER
'floor AS INTEGER
'hitpoints AS INTEGER

'class AS INTEGER
'level AS INTEGER
'strength AS INTEGER
'speed AS INTEGER
'intelligence AS INTEGER
'zeal AS INTEGER

'END TYPE


CLS
COLOR 15, 0
PRINT "----- Character Status -----"
PRINT "Hitpoints:"; PlayerOne.hitpoints
PRINT "Class:"; PlayerOne.class
PRINT "Strength:"; PlayerOne.strength
PRINT "Speed:"; PlayerOne.speed
PRINT "Intelligence:"; PlayerOne.intelligence
PRINT "Zeal:"; PlayerOne.zeal

END SUB

SUB SortInventory
DIM i%, k%

FOR k% = 0 TO INVENTORYMAX - 2
    FOR i% = 0 TO INVENTORYMAX - 2
        IF PlayerInventory(i%).id = 0 THEN
            PlayerInventory(i%) = PlayerInventory(i% + 1)
            PlayerInventory(i% + 1).id = 0
        END IF
    NEXT i%
NEXT k%

END SUB

SUB UseInventoryItem (index%)

IF PlayerInventory(index%).id = IDPOTION THEN
    AddMessage GetItemName(PlayerInventory(index%)) + " used..."
    PlayerInventory(index%).stackcount = PlayerInventory(index%).stackcount - 1
    IF PlayerInventory(index%).stackcount <= 0 THEN
        PlayerInventory(index%).id = 0
    END IF
    PlayerOne.hitpoints = PlayerOne.hitpoints + 50
ELSE
    AddMessage "Nothing happened..."
END IF

SortInventory

'TYPE Item
'x AS INTEGER
'y AS INTEGER
'char AS INTEGER
'id AS INTEGER
'stackflag AS INTEGER
'stackcount AS INTEGER
'maxstacksize AS INTEGER
'canequipflag AS INTEGER
'equipstatus AS INTEGER
'END TYPE

END SUB

