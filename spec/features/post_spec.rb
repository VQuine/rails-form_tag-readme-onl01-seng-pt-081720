require 'rails_helper'

describe 'new post' do
    it 'ensures that the form route works with the /new action' do

        visit new_post_path
        expect(page.status_code).to eq(200)

    end

    it 'renders HTML in the /new template' do
        
        visit new_post_path
        expect(page).to have_content('Post Form')

    end

    it "DISPLAYs a NEW POST FORM that REDIRECTS to the INDEX PAGE, which then contains the submitted post's TITLE and DESCRIPTION" do
        
        visit new_post_path
        fill_in 'post_title', with: 'My post title'
        fill_in 'post_description', with: 'My post description'

        click_on 'Submit Post'

        expect(page.current_path).to eq(posts_path)
        expect(page).to have_content('My post title')
        expect(page).to have_content('My post description')

    end
end