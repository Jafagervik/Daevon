#pragma once

#ifdef DV_PLATFORM_WINDOWS
	#ifdef DV_BUILD_DLL
		#define DAEVON_API __declspec(dllexport)
	#else
		#define DAEVON_API __declspec(dllimport)
	#endif
#else
	#error Daevon only supports Windows!
#endif