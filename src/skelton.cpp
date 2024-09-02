// Filename   : skelton.cpp
// Last Change: 2023-04-20 10:15:28.
//
#include "skelton.h"

MainFrame::MainFrame(wxWindow* parent, wxWindowID id, const wxString& title, const wxPoint& pos, const wxSize& size, long style) 
    : wxFrame(parent, id, title, pos, size, style)
{
	this->SetSizeHints(wxDefaultSize, wxDefaultSize);
	this->SetBackgroundColour(wxColour(180, 240, 220));

	wxBoxSizer* TopSizer = new wxBoxSizer(wxVERTICAL);

	m_textCtrl = new wxTextCtrl(this, wxID_ANY, wxEmptyString, wxDefaultPosition, wxDefaultSize, 0);
	TopSizer->Add(m_textCtrl, 1, wxALL|wxEXPAND, 5);

	m_button = new wxButton(this, wxID_ANY, _("Greek"), wxDefaultPosition, wxDefaultSize, 0);

	m_button->SetDefault();
	TopSizer->Add(m_button, 0, wxALL|wxALIGN_CENTER_HORIZONTAL, 5);


	this->SetSizer(TopSizer);
	this->Layout();

	this->Centre(wxBOTH);

	// Connect Events
	m_button->Connect(wxEVT_COMMAND_BUTTON_CLICKED, wxCommandEventHandler(MainFrame::OnClick), NULL, this);
}

MainFrame::~MainFrame()
{
	// Disconnect Events
	m_button->Disconnect(wxEVT_COMMAND_BUTTON_CLICKED, wxCommandEventHandler(MainFrame::OnClick), NULL, this);
}

