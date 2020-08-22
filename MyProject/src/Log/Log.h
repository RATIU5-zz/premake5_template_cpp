#pragma once

#include "Core.h"

#include "spdlog\spdlog.h"
#include "spdlog\fmt\ostr.h"

namespace App {
	class Log
	{
	public:
		static void Init();

		inline static Ref<spdlog::logger>& GetCoreLogger() { return s_CoreLogger; }
		inline static Ref<spdlog::logger>& GetClientLogger() { return s_ClientLogger; }
	private:
		static std::shared_ptr<spdlog::logger> s_CoreLogger;
		static std::shared_ptr<spdlog::logger> s_ClientLogger;

	};
}

// Core log macros
#define _CORE_TRACE(...)    ::App::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define _CORE_INFO(...)     ::App::Log::GetCoreLogger()->info(__VA_ARGS__)
#define _CORE_WARN(...)     ::App::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define _CORE_ERROR(...)    ::App::Log::GetCoreLogger()->error(__VA_ARGS__)
#define _CORE_FATAL(...)    ::App::Log::GetCoreLogger()->critical(__VA_ARGS__)

// Client log macros
#define _TRACE(...)	      ::App::Log::GetClientLogger()->trace(__VA_ARGS__)
#define _INFO(...)	      ::App::Log::GetClientLogger()->info(__VA_ARGS__)
#define _WARN(...)	      ::App::Log::GetClientLogger()->warn(__VA_ARGS__)
#define _ERROR(...)	      ::App::Log::GetClientLogger()->error(__VA_ARGS__)
#define _FATAL(...)	      ::App::Log::GetClientLogger()->critical(__VA_ARGS__) 
