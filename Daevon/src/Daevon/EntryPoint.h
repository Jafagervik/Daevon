#pragma once

#ifdef DV_PLATFORM_WINDOWS

extern Daevon::Application* Daevon::CreateApplication();

int main(int argc, char** argv )
{
	auto app = Daevon::CreateApplication();
	app->Run();
	delete app;
}

#endif
