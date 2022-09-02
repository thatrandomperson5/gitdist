@Echo off
Setlocal EnableDelayedExpansion

REM THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY
REM KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
REM WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
REM AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
REM HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
REM WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
REM OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
REM DEALINGS IN THE SOFTWARE.

REM This program is free software: you can redistribute it and/or modify
REM it under the terms of the GNU General Public License as published by
REM the Free Software Foundation, either version 3 of the License, or
REM (at your option) any later version. 
REM see www.gnu.org/licenses


REM Starting Main Program...
:Main
(
Echo.#requires -version 2
Echo.# This is not my script, it was found here:
Echo.# http://web.archive.org/web/20170516120430/http://poshcode.org/2049
Echo.#
Echo. 
Echo.if ^(-not ^("win32.nativemethods" -as [type]^)^) {
Echo.# import sendmessagetimeout from win32
Echo.add-type -Namespace Win32 -Name NativeMethods -MemberDefinition @^"
Echo.[DllImport^("user32.dll", SetLastError = true, CharSet = CharSet.Auto^)]
Echo.public static extern IntPtr SendMessageTimeout^(
Echo.   IntPtr hWnd, uint Msg, UIntPtr wParam, string lParam,
Echo.   uint fuFlags, uint uTimeout, out UIntPtr lpdwResult^);
Echo.^"@
Echo.}
Echo. 
Echo.$HWND_BROADCAST = [intptr]0xffff;
Echo.$WM_SETTINGCHANGE = 0x1a;
Echo.$result = [uintptr]::zero
Echo. 
Echo.# notify all windows of environment block change
Echo.[win32.nativemethods]::SendMessageTimeout^($HWND_BROADCAST, $WM_SETTINGCHANGE,
Echo.[uintptr]::Zero, "Environment", 2, 5000, [ref]$result^); 
) >"%Temp%\EnvUpdate.ps1"

for /f %%a in ('powershell -ExecutionPolicy Bypass "!Temp!\EnvUpdate.ps1"') do (set "_Result=%%~a")
if /i "%_Result%" == "0" (Echo. Changes not applied!&& Exit /b 1)
Exit /b 0
