#pragma once

#include "Core.h"

namespace Daevon {

	class DAEVON_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};

	// To be defined in client
	Application* CreateApplication();
}

