#pragma once

#ifdef DV_PLATFORM_WINDOWS

extern Daevon::Application* Daevon::CreateApplication();

int main(int argc, char** argv )
{
	Daevon::Log::Init();
	DV_CORE_WARN("Initialized Log!");
	DV_INFO("Hello there!");

	auto app = Daevon::CreateApplication();
	app->Run();
	delete app;
}

#endif
