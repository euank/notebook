class Group < ActiveRecord::Base
  acts_as_paranoid

  validates :name, presence: true

  belongs_to :user
  validates :user_id, presence: true

  include BelongsToUniverse

  include HasAttributes
  include HasPrivacy
  include HasContentGroupers
  include HasImageUploads
  include HasChangelog

  include Serendipitous::Concern

  include Authority::Abilities
  self.authorizer_name = 'ExtendedContentAuthorizer'

  relates :leaders, with: :group_leaderships
  relates :members, with: :group_memberships
  relates :supergroups, with: :supergroupships
  relates :subgroups, with: :subgroupships
  relates :sistergroups, with: :sistergroupships
  relates :allies, with: :group_allyships
  relates :enemies, with: :group_enemyships
  relates :rivals, with: :group_rivalships
  relates :clients, with: :group_clientships
  relates :suppliers, with: :group_supplierships
  relates :locations, with: :group_locationships
  relates :headquarters, with: :headquarterships
  relates :offices, with: :officeships
  relates :equipment, with: :group_equipmentships
  relates :key_items, with: :key_itemships
  relates :creatures, with: :group_creatures

  def self.color
    'cyan'
  end

  def self.icon
    'wc'
  end

  def self.content_name
    'group'
  end
end
