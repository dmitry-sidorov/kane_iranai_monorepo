import React from "react";
import { createInertiaApp } from "@inertiajs/react";
import { createRoot } from "react-dom/client";

createInertiaApp({
  resolve: (name) => import(`./pages/${name}.tsx`),
  setup({ el, App, props }) {
    createRoot(el).render(<App {...props} />);
  },
  http: {
    xsrfHeaderName: "x-csrf-token",
  },
});
