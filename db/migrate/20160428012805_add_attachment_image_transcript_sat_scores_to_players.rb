class AddAttachmentImageTranscriptSatScoresToPlayers < ActiveRecord::Migration
  def self.up
    change_table :players do |t|
      t.attachment :image
      t.attachment :transcript
      t.attachment :sat_scores
    end
  end

  def self.down
    remove_attachment :players, :image
    remove_attachment :players, :transcript
    remove_attachment :players, :sat_scores
  end
end
