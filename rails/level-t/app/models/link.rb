class Link < ApplicationRecord

    validates :title, presence: true,
                    length: { in: 3..50, too_long: "%{count} caractères est le maximum autorisé", too_short: "%{count} caractères minimum sont requis" }

    validates :description, presence: true,
                    length: { minimum: 3, too_short: "%{count} caractères minimum sont requis" }

    validates :name, presence: true,
                        length: { in: 2..60, too_long: "%{count} caractères est le maximum autorisé", too_short: "%{count} caractères minimum sont requis" }

    validates :link, presence: true,
                        length: { in: 6..70, too_long: "%{count} caractères est le maximum autorisé", too_short: "%{count} caractères minimum sont requis" }

end
