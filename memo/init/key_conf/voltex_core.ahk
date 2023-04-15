; Colemak layout for AutoHotkey (MS Windows)
; 2006-01-01 Shai Coleman, http://colemak.com/ . Public domain.
; See http://www.autohotkey.com/ for more information

; For this to work you have to make sure that the US (QWERTY) layout is installed,
; that is set as the default layout, and that it is set as the current layout.
; Otherwise some of the key mappings will be wrong.
;
; This is mainly useful for those who don't have privileges to install a new layout
; This doesn't support the international features of the Colemak layout.

#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 3  ; Exact matching to avoid confusing T/B with Tab/Backspace.

; If the script is not elevated, relaunch as administrator and kill current instance:

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try ; leads to having the script re-launching itself as administrator
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp
}

<!a::Sendraw @
<!r::Sendraw #
<!s::Sendraw $
<!t::Sendraw `%
<!d::Sendraw ^
<!h::Sendraw &
<!n::Sendraw *
<!e::Sendraw (
<!i::Sendraw )
<!o::Sendraw _
<!b::Sendraw "
<!k::Sendraw ?
<!m::Sendraw {
<!,::Sendraw }
<!.::Sendraw |
^<!::Sendraw !
<!Enter::Sendraw +
<!q::Sendraw ~

 #InstallKeybdHook

  $*Space::                           ;スペース押下時
      ;tooltip,"%SandS_mod%" "%SandS_key%" %SandS_guard%  ;debug

      if SandS_guard = True           ;スペースキーガード
          Return
      SandS_guard = True              ;スペースキーにガードをかける

      Send,{Shift Down}               ;シフトキーを仮想的に押し下げる

      SandS_mod=                      ;装飾キー退避
      GetKeyState, state, Shift,P
      if state=D
          SandS_mod=%SandS_mod%+
      GetKeyState, state, Ctrl,P
      if state=D
          SandS_mod=%SandS_mod%^
      GetKeyState, state, Alt,P
      if state=D
          SandS_mod=%SandS_mod%!

      GetKeyState, state, LWin,P
      if state=D
          SandS_mod=%SandS_mod%#
      GetKeyState, state, RWin,P
      if state=D
          SandS_mod=%SandS_mod%#

      ifNotEqual SandS_key            ;文字入力済みの場合は終わり
          return
      SandS_key=
      Input,SandS_key,L1 V            ;1文字入力を受け付け（入力有無判定用）

      Return


  $*Space up::                        ;スペース解放時
      ;tooltip,"%SandS_mod%" "%SandS_key%" %SandS_guard%  ;debug

      input                           ;既存のInputコマンドの終了
      SandS_guard = False             ;スペースキーガードを外す
      Send,{Shift Up}                 ;シフトキー解放

      ifNotEqual SandS_mod            ;修飾キーありの場合
          Send,%SandS_mod%{Space}     ;自前で修飾しながらスペースを発射！
      else                            ;修飾キー同時押しではなかった場合
          ifEqual SandS_key           ;SandS文字入力なし
              Send,{Space}            ;単打のスペースを発射

      SandS_key=
      Return
