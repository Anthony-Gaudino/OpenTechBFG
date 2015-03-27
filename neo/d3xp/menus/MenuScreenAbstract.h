/*
===========================================================================

Doom 3 BFG Edition GPL Source Code
Copyright (C) 1993-2012 id Software LLC, a ZeniMax Media company.
Copyright (C) 2014 Robert Beckebans

This file is part of the Doom 3 BFG Edition GPL Source Code ("Doom 3 BFG Edition Source Code").

Doom 3 BFG Edition Source Code is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Doom 3 BFG Edition Source Code is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Doom 3 BFG Edition Source Code.  If not, see <http://www.gnu.org/licenses/>.

In addition, the Doom 3 BFG Edition Source Code is also subject to certain additional terms. You should have received a copy of these additional terms immediately following the terms and conditions of the GNU General Public License which accompanied the Doom 3 BFG Edition Source Code.  If not, please request a copy in writing from id Software at the address below.

If you have questions concerning this license or the applicable additional terms, you may contact in writing id Software LLC, c/o ZeniMax Media Inc., Suite 120, Rockville, Maryland 20850 USA.

===========================================================================
*/
#ifndef __MENUSCREENABSTRACT_H__
#define __MENUSCREENABSTRACT_H__

class idPlayer;
class idDeclPDA;
class idStr;

enum cursorState_t
{
	CURSOR_NONE,
	CURSOR_IN_COMBAT,
	CURSOR_TALK,
	CURSOR_GRABBER,
	CURSOR_ITEM,
};

//*
//================================================
//idMenuScreen_HUD
//================================================
//*/
class idMenuScreen_HUDAbstract
{
public:
	virtual ~idMenuScreen_HUDAbstract() {}
	
	virtual void UpdateHealthArmor( idPlayer* player ) = 0;
	virtual void UpdateStamina( idPlayer* player ) = 0;
	virtual void UpdateLocation( idPlayer* player ) = 0;
	virtual void UpdateWeaponInfo( idPlayer* player ) = 0;
	virtual void UpdateWeaponStates( idPlayer* player, bool weaponChanged ) = 0;
	
	virtual void DownloadVideo() = 0;
	virtual void DownloadPDA( const idDeclPDA* pda, bool newSecurity ) = 0;
	
	virtual void ClearNewPDAInfo() = 0;
	
	virtual void UpdateOxygen( bool show, int val = 0 ) = 0;
	virtual void SetupObjective( const idStr& title, const idStr& desc, const idMaterial* screenshot ) = 0;
	virtual void SetupObjectiveComplete( const idStr& title ) = 0;
	virtual void ShowObjective( bool complete ) = 0;
	virtual void HideObjective( bool complete ) = 0;
	virtual void GiveWeapon( idPlayer* player, int weaponIndex ) = 0;
	virtual void UpdatePickupInfo( int index, const idStr& name ) = 0;
	virtual bool IsPickupListReady() = 0;
	virtual void ShowPickups() = 0;
	virtual void SetCursorState( idPlayer* player, cursorState_t state, int set ) = 0;
	virtual void SetCursorText( const idStr& action, const idStr& focus ) = 0;
	virtual void UpdateCursorState() = 0;
	virtual void CombatCursorFlash() = 0;
	virtual void ShowRespawnMessage( bool show ) = 0;
	virtual void SetShowSoulCubeOnLoad( bool show ) = 0;
	
	// MULTIPLAYER
	
	virtual void ToggleMPInfo( bool show, bool showTeams, bool isCTF = false ) = 0;
	virtual void SetFlagState( int team, int state ) = 0;
	virtual void SetTeamScore( int team, int score ) = 0;
	virtual void SetTeam( int team ) = 0;
	virtual void TriggerHitTarget( bool show, const idStr& target, int color = 0 ) = 0;
	virtual void ToggleLagged( bool show ) = 0;
	virtual void UpdateGameTime( const char* time ) = 0;
	virtual void UpdateMessage( bool show, const idStr& message ) = 0;
	virtual void ShowNewItem( const char* name, const char* icon ) = 0;
	virtual void UpdateFlashlight( idPlayer* player ) = 0;
	virtual void UpdateChattingHud( idPlayer* player ) = 0;
};

#endif // __MENUSCREENABSTRACT_H__
