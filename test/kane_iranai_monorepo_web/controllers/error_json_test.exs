defmodule KaneIranaiMonorepoWeb.ErrorJSONTest do
  use KaneIranaiMonorepoWeb.ConnCase, async: true

  test "renders 404" do
    assert KaneIranaiMonorepoWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert KaneIranaiMonorepoWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
