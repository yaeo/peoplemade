crumb :root do
  link "HOME", root_path
end

crumb :story do |story|
  link story.title, story_path(story)
end

crumb :new_story do
  link "ストーリーを作成", new_story_path
end

crumb :story_list do
  link "ストーリーの編集", stories_path
end

crumb :edit_story do
  link "ストーリーを作成", edit_story_path
end

crumb :profile do
  link "基本情報設定", profile_path
end
