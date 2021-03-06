#pragma once

#include <memory>

#include "Core.h"
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"

namespace Daevon {

	class DAEVON_API Log
	{
	public:
		static void Init();

		inline static std::shared_ptr<spdlog::logger>& GetCoreLogger   { return s_CoreLogger;    }
		inline static std::shared_ptr<spdlog::logger>& GetClientLogger { return s_ClientLogger;  }
	
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};

}

//Core log macros
#define DV_CORE_TRACE(...)    ::Daevon::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define DV_CORE_INFO(...)     ::Daevon::Log::GetCoreLogger()->info(__VA_ARGS__)
#define DV_CORE_WARN(...)     ::Daevon::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define DV_CORE_ERROR(...)    ::Daevon::Log::GetCoreLogger()->error(__VA_ARGS__)
#define DV_CORE_FATAL(...)    ::Daevon::Log::GetCoreLogger()->fatal(__VA_ARGS__)

//Client log macros
#define DV_TRACE(...)         ::Daevon::Log::GetClientLogger()->trace(__VA_ARGS__)
#define DV_INFO(...)          ::Daevon::Log::GetClientLogger()->info(__VA_ARGS__)
#define DV_WARN(...)          ::Daevon::Log::GetClientLogger()->warn(__VA_ARGS__)
#define DV_ERROR(...)         ::Daevon::Log::GetClientLogger()->error(__VA_ARGS__)
#define DV_FATAL(...)         ::Daevon::Log::GetClientLogger()->fatal(__VA_ARGS__)

// if dist build