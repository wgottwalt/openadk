/*
 *      Copyright (C) 2014 Team XBMC
 *      http://www.xbmc.org
 *
 *  This Program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2, or (at your option)
 *  any later version.
 *
 *  This Program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with XBMC; see the file COPYING.  If not, see
 *  <http://www.gnu.org/licenses/>.
 *
 */
 
#if defined (_LINUX)

#include <stdlib.h>
#include "LinuxPowerSyscall.h"
#include "utils/log.h"

CLinuxPowerSyscall::CLinuxPowerSyscall()
{ 
      CLog::Log(LOGINFO, "Selected LinuxPower as PowerSyscall");
}

CLinuxPowerSyscall::~CLinuxPowerSyscall()
{ }

bool CLinuxPowerSyscall::Powerdown()
{
  system("/sbin/poweroff -F");
  return 0;
}

bool CLinuxPowerSyscall::Reboot()
{
  system("/sbin/reboot -F");
  return 0;
}

int CLinuxPowerSyscall::BatteryLevel(void)
{ }

bool CLinuxPowerSyscall::PumpPowerEvents(IPowerEventsCallback *callback)
{    
  return true;
}

#endif

