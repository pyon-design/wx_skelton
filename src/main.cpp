// Filename   : main.cpp
// Last Change: 2023-04-20 09:42:33.
//
#include "main.h"
#include "skelton.h"

IMPLEMENT_APP(MyApp)

IMPLEMENT_CLASS(MyApp, wxApp)

MyApp::MyApp()
{
}
MyApp::~MyApp()
{
}

bool MyApp::OnInit()
{
    if (!wxApp::OnInit()) return false;

	MainFrame *frame = new MainFrame(NULL, wxID_ANY, wxT("Skelton"), wxDefaultPosition, wxSize(290, 330), wxDEFAULT_FRAME_STYLE);
	frame->Show(true);
	frame->Raise();

    return true;
}

int MyApp::OnExit()
{
    return 0;
}

