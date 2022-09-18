import React from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";

import { createTheme, CssBaseline, ThemeProvider } from "@mui/material";

// Pages
import Home from "./pages/Home";
import ScrapPricing from "./pages/ScrapPricing";

const darkTheme = createTheme({
  palette: {
    mode: "dark",
    primary: {
      main: "#27ba32",
      light: "#4caf50",
      dark: "#27ba32",
      contrastText: "#fff",
    },
  },
});

const App = () => {
  return (
    <>
      <ThemeProvider theme={darkTheme}>
        <CssBaseline />

        <BrowserRouter>
          <Routes>
            <Route path="/">
              <Route index element={<Home />} />
              <Route path="scrap-pricing" element={<ScrapPricing />} />
            </Route>
          </Routes>
        </BrowserRouter>
      </ThemeProvider>
    </>
  );
};

export default App;
