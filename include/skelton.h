// Filename   : skelton.h
// Last Change: 2023-04-20 09:34:46.
//
#pragma once

#include <wx/artprov.h>
#include <wx/xrc/xmlres.h>
#include <wx/intl.h>
#include <wx/string.h>
#include <wx/textctrl.h>
#include <wx/gdicmn.h>
#include <wx/font.h>
#include <wx/colour.h>
#include <wx/settings.h>
#include <wx/button.h>
#include <wx/bitmap.h>
#include <wx/image.h>
#include <wx/icon.h>
#include <wx/sizer.h>
#include <wx/frame.h>
#include <wx/msgdlg.h>

class MainFrame : public wxFrame
{
	private:

	protected:
		wxTextCtrl* m_textCtrl;
		wxButton* m_button;

		// Virtual event handlers, override them in your derived class
		virtual void OnClick(wxCommandEvent& event) {wxMessageBox(_("Hello wxWidgets !"));}

	public:
		MainFrame(wxWindow* parent, wxWindowID id = wxID_ANY, const wxString& title = wxEmptyString, const wxPoint& pos = wxDefaultPosition, const wxSize& size = wxSize( 500,300 ), long style = wxDEFAULT_FRAME_STYLE|wxTAB_TRAVERSAL);
		~MainFrame();
};

