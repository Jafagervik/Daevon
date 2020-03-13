#include <Daevon.h>

class Sandbox : public Daevon::Application {
public:
	Sandbox() {

	}

	~Sandbox() {

	}
};

Daevon::Application* Daevon::CreateApplication() 
{
	return new Sandbox();
}