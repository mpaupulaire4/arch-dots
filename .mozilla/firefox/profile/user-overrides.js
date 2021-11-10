/*** MY OVERRIDES ***/
user_pref("_user.js.parrot", "overrides section syntax error");

/* 5003: disable saving passwords
 * [NOTE] This does not clear any passwords already saved
 * [SETTING] Privacy & Security>Logins and Passwords>Ask to save logins and passwords for websites ***/
  user_pref("signon.rememberSignons", false);
/* 5007: exclude "Undo Closed Tabs" in Session Restore ***/
  // user_pref("browser.sessionstore.max_tabs_undo", 0);
/* 5008: disable resuming session from crash ***/
  user_pref("browser.sessionstore.resume_from_crash", false);
/* 5010: disable location bar suggestion types
 * [SETTING] Privacy & Security>Address Bar>When using the address bar, suggest ***/
  // user_pref("browser.urlbar.suggest.history", false);
  user_pref("browser.urlbar.suggest.bookmark", false);
  // user_pref("browser.urlbar.suggest.openpage", false);
  user_pref("browser.urlbar.suggest.topsites", false); // [FF78+]


/* 1702: set behaviour on "+ Tab" button to display container menu on left click [FF74+]
 * [NOTE] The menu is always shown on long press and right click
 * [SETTING] General>Tabs>Enable Container Tabs>Settings>Select a container for each new tab ***/
  user_pref("privacy.userContext.newTabContainerOnLeftClick.enabled", true);




/*** [SECTION 9000]: PERSONAL
  Non-project related but useful. If any interest you, add them to your overrides
***/
/* APPEARANCE ***/
  user_pref("ui.systemUsesDarkTheme", 1); // [FF67+] [HIDDEN PREF]
/* CONTENT BEHAVIOR ***/
  user_pref("accessibility.typeaheadfind", true); // enable "Find As You Type"
/* UX BEHAVIOR ***/
  user_pref("browser.quitShortcut.disabled", true); // disable Ctrl-Q quit shortcut [LINUX] [MAC] [FF87+]
  user_pref("browser.tabs.closeWindowWithLastTab", false);
  user_pref("browser.tabs.loadBookmarksInTabs", true); // open bookmarks in a new tab [FF57+]
/* UX FEATURES ***/
  user_pref("extensions.pocket*.enabled", false); // Pocket Account [FF46+]
  user_pref("identity.fxaccounts.enabled", false); // Firefox Accounts & Sync [FF60+] [RESTART]
/* OTHER ***/
