import React from "react";
function HomePageButton() {
  return (
    <button
      type="button"
      class="btn btn-outline-info "
      onClick={() => {
        const {
          host,
          hostname,
          href,
          origin,
          pathname,
          port,
          protocol,
          search,
        } = window.location;
        window.open(origin, "_blank");
      }}
    >
      Explore DCV
    </button>
  );
}
export default HomePageButton;
