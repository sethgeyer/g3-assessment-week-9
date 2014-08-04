feature "ToDos" do
  scenario "A user can sign in a create a ToDo" do

    visit "/"

    register_and_sign_in

    expect(page).to have_content "Welcome, hunta"

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

    expect(page).to have_content "ToDo added"

    within ".todos" do
      expect(page).to have_content "Get a haircut"
    end
  end

  scenario "A signed-in user can edit an already created 'to-do'" do

    visit "/"

    register_and_sign_in

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

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

    register_and_sign_in

    fill_in "What do you need to do?", with: "Get a haircut"
    click_button "Add ToDo"

    expect(page).to have_button("Complete")

    click_on "Complete"

    expect(page).not_to have_content("Get a haircut")

  end



end
