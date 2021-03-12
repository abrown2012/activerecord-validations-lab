class TitleValidator < ActiveModel::Validator 
    def validate(record)
        if record.title
            reqs = ["Won't Believe", "Secret", "Top [number]", "Guess"]
            if reqs.detect {|el| record.title.include?(el) }.nil?
              record.errors[:title] << "Must contain clickbait"
            end
        end
    end
end


# Finally, add a custom validator to Post that ensures
#  the title is sufficiently clickbait-y. If the title does not
#   contain "Won't Believe", "Secret", "Top [number]", 
#   or "Guess", the validator should add a validation.