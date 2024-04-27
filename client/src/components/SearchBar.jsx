import React, { useState } from "react";
function SearchBar() {
  const [userid, setuserid] = useState(null);
  return (
    <form
      class="d-flex"
      role="search"
      onSubmit={() => {
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
        window.open(`${origin}/${userid}`, "_blank");
      }}
    >
      <input
        class="form-control me-2"
        type="search"
        placeholder="User ID"
        aria-label="Search"
        value={userid}
        onChange={(e) => {
          setuserid(e.target.value);
          console.log(userid);
        }}
      />
      <button class="btn btn-outline-success" type="submit">
        Find
      </button>
    </form>
  );
}
export default SearchBar;
