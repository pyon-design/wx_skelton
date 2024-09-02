// Filename   : main.h
// Last Change: 2023-04-07 16:16:59.
//
#pragma once

#include <wx/wx.h>

// private classes
// Define a new application type, each program should derive a class from wxApp
class MyApp : public wxApp
{
	DECLARE_CLASS(MyApp)
	private:

	public:
		MyApp();
		~MyApp();

		virtual bool OnInit();
		virtual int  OnExit();
};

DECLARE_APP(MyApp)

