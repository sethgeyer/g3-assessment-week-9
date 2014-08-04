feature "ToDos" do
  scenario "A user can sign in a create a ToDo" do

    visit "/"
    register_and_sign_in("hunta", "pazzword")
    expect(page).to have_content "Welcome, hunta"
    create_a_to_do("Get a haircut")
    expect(page).to have_content "ToDo added"
    within ".todos" do
      expect(page).to have_content "Get a haircut"
    end
  end

  scenario "A user can see only their todos" do

    visit "/"
    register_and_sign_in("seth", "pazzword")
    create_a_to_do("Shave my back")
    click_on "Sign Out"

    register_and_sign_in("hunta", "pazzword")
    expect(page).to have_content "Welcome, hunta"
    create_a_to_do("Get a haircut")
    expect(page).to have_content "ToDo added"
    within ".todos" do
      expect(page).to have_content "Get a haircut"
      expect(page).not_to have_content "Shave my back"

    end
  end


  scenario "A signed-in user can edit an already created 'to-do'" do

    visit "/"
    register_and_sign_in("hunta", "pazzword")
    create_a_to_do("Get a haircut")
    expect(page).to have_link("Edit")
    click_on "Edit"
    expect(page).to have_css("#edit_todos")
    expect(page).to have_content("Get a haircut")
    fill_in "Description", with: "Shave my back"
    click_on "Update ToDo"
    expect(page).to have_content("Shave my back")
    expect(page).not_to have_content("Get a haircut")
    expect(page).to have_link("Edit")

  end


  scenario "A signed-in user can complete an already created 'to-do'" do

    visit "/"
    register_and_sign_in("hunta", "pazzword")
    create_a_to_do("Get a haircut")
    expect(page).to have_button("Complete")
    click_on "Complete"

    expect(page).not_to have_content("Get a haircut")

  end



end
