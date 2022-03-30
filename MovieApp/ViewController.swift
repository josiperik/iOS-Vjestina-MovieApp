//
//  ViewController.swift
//  MovieApp
//
//  Created by FIVE on 27.03.2022..
//
import SnapKit
import UIKit

class ViewController: UIViewController {
    private var movieImage = UIImageView()
    private var movieTitle = UILabel()
    private var movieDate = UILabel()
    private var genres = UILabel()
    private var duration = UILabel()
    private var scorePrecentage = UILabel()
    private var scoreLabel = UILabel()
    private var overviewLabel = UILabel()
    private var MovieDescription = UILabel()
    private var circleIcon = UIImageView()
    private var starIcon = UIImageView()
    private var person1  = UILabel()
    private var person2  = UILabel()
    private var person3  = UILabel()
    private var person4  = UILabel()
    private var person5  = UILabel()
    private var person6  = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor(white: 1, alpha: 1)
        setUpSubviews()
        setUpConstraints()
                                       
    }
    private func setUpSubviews() {
    
        movieImage.image = cropToBounds(image: UIImage(named: "IronMan")!, width: 363, height: 303)
        movieImage.contentMode = .scaleAspectFill
        movieImage.layer.masksToBounds = true
        view.addSubview(movieImage)
        
        movieTitle.text = "Iron Man (2008)"
        movieTitle.textColor = .white
        movieTitle.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(movieTitle)
        
        movieDate.text = "05/02/2008 (US)"
        movieDate.textColor = .white
        movieDate.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(movieDate)
        

        genres.text = "Action, Science Fiction, Adventure"
        genres.textColor = .white
        genres.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(genres)
        
        scorePrecentage.text = "76%"
        scorePrecentage.textColor = .white
        scorePrecentage.font = UIFont.boldSystemFont(ofSize: 15 )
        view.addSubview(scorePrecentage)
        
        scoreLabel.text = "User Score"
        scoreLabel.textColor = .white
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(scoreLabel)
        
        let attributedString = NSMutableAttributedString(string: "After being held captive in an Afghan cave,\nbillionare engineer Tony Stark creates a unique\nweaponized suit of armor to fight evil. ")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        MovieDescription.attributedText = attributedString
        MovieDescription.numberOfLines = 0;
        MovieDescription.textColor = .black
        MovieDescription.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(MovieDescription)
        
        overviewLabel.text = "Overwiew"
        overviewLabel.textColor = .black
        overviewLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(overviewLabel)
        
        duration.text = "2h 6m"
        duration.font = UIFont.boldSystemFont(ofSize: 14)
        duration.textColor = .white
        view.addSubview(duration)

        circleIcon.image = UIImage(systemName: "circle.fill")!
        circleIcon.tintColor = .black
        let config1 = UIImage.SymbolConfiguration(paletteColors: [.darkGray])
        circleIcon.backgroundColor = .darkGray
        circleIcon.preferredSymbolConfiguration = config1
        circleIcon.layer.cornerRadius = 16
        view.addSubview(circleIcon)
        
        starIcon.image = UIImage(systemName: "star")!
        let config = UIImage.SymbolConfiguration(paletteColors: [.white, .clear,])
        starIcon.backgroundColor = .clear
        starIcon.preferredSymbolConfiguration = config
//        starIcon.preferredImageVariantShape = UIImage.VariantShape.circle
        view.addSubview(starIcon)
//        starIcon.layer.cornerRadius = 16
        

        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
        let roleAtributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]
        
        let characterRole = " \nCharacters"
        let characterString = NSMutableAttributedString(string: characterRole, attributes: roleAtributes)
        
        
        
        let directorRole = " \nDirector"
        let directorString = NSMutableAttributedString(string: directorRole, attributes: roleAtributes)
        
        let screenPlayRole = " \nScreenplay"
        let screenplayString = NSMutableAttributedString(string: screenPlayRole, attributes: roleAtributes)
        
       
        
        let person_1 = "Don Heck"
        let attributedStrings = NSMutableAttributedString(string:person_1, attributes:attrs)
        attributedStrings.append(characterString)
        person1.attributedText = attributedStrings
        person1.numberOfLines = 0;
        person1.textColor = .black
        view.addSubview(person1)
        
        let person_2 = "Jack Kirby"
        let attributedStrings2 = NSMutableAttributedString(string:person_2, attributes:attrs)
        attributedStrings2.append(characterString)
        person2.attributedText = attributedStrings2
        person2.numberOfLines = 0;
        person2.textColor = .black
        view.addSubview(person2)
        
        let person_3 = "Jon Favreau"
        let attributedStrings3 = NSMutableAttributedString(string:person_3, attributes:attrs)
        attributedStrings3.append(directorString)
        person3.attributedText = attributedStrings3
        person3.numberOfLines = 0;
        person3.textColor = .black
        view.addSubview(person3)
        
        let person_4 = "Don Heck"
        let attributedStrings4 = NSMutableAttributedString(string:person_4, attributes:attrs)
        attributedStrings4.append(screenplayString)
        person4.attributedText = attributedStrings4
        person4.numberOfLines = 0;
        person4.textColor = .black
        view.addSubview(person4)
        
        let person_5 = "Jack Marcum"
        let attributedStrings5 = NSMutableAttributedString(string:person_5, attributes:attrs)
        attributedStrings5.append(screenplayString)
        person5.attributedText = attributedStrings5
        person5.numberOfLines = 0;
        person5.textColor = .black
        view.addSubview(person5)
        
        let person_6 = "Matt Holloway"
        let attributedStrings6 = NSMutableAttributedString(string:person_6, attributes:attrs)
        attributedStrings6.append(screenplayString)
        person6.attributedText = attributedStrings6
        person6.numberOfLines = 0;
        person6.textColor = .black
        view.addSubview(person6)
        
        
        
        
    }
    private func setUpConstraints() {
       movieTitle.snp.makeConstraints{
            $0.top.equalTo(movieImage).offset(160)
            $0.leading.equalTo(movieImage).inset(20)
           
           
           }
       movieImage.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalToSuperview()
            $0.height.equalTo(303)
            $0.width.equalTo(363)
           
      }
        
        movieDate.snp.makeConstraints{
            $0.top.equalTo(movieTitle.snp.bottom).offset(10)
            $0.leading.equalTo(movieImage).inset(20)
        }
        genres.snp.makeConstraints{
            $0.top.equalTo(movieDate.snp.bottom).offset(5)
            $0.leading.equalTo(movieImage).inset(20)
        }
        duration.snp.makeConstraints{
            $0.leading.equalTo(genres.snp.trailing).offset(10)
            $0.centerY.equalTo(genres)
            }
          
      
        scorePrecentage.snp.makeConstraints{
            $0.bottom.equalTo(movieTitle.snp.top).offset(-10)
            $0.leading.equalTo(movieImage).inset(25)
            //$0.width.height.equalTo(500)
            
        }
        scoreLabel.snp.makeConstraints{
            $0.centerY.equalTo(scorePrecentage)
            $0.leading.equalTo(scorePrecentage.snp.trailing).offset(25)
            }
        
   
        overviewLabel.snp.makeConstraints{
            $0.top.equalTo(movieImage.snp.bottom).offset(20)
            $0.leading.equalTo(movieImage).inset(16)
                                            
        }
        MovieDescription.snp.makeConstraints{
            $0.top.equalTo(overviewLabel.snp.bottom).offset(16)
            $0.leading.equalTo(movieImage).inset(16)
        }
        circleIcon.snp.makeConstraints{
            $0.top.equalTo(genres.snp.bottom).offset(10)
            $0.leading.equalTo(movieImage).offset(20)
            $0.width.height.equalTo(32)
        }
        starIcon.snp.makeConstraints{
            $0.center.equalTo(circleIcon)
            $0.width.height.equalTo(15)

        }

        person2.snp.makeConstraints{
            $0.leading.equalTo(person1.snp.trailing).offset(44)
            $0.top.equalTo(MovieDescription.snp.bottom).offset(22)
        }
       
        person1.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(MovieDescription.snp.bottom).offset(22)
        }
        person3.snp.makeConstraints{
            $0.leading.equalTo(person2.snp.trailing).offset(55)
            $0.top.equalTo(MovieDescription.snp.bottom).offset(22)
        }
        
        person5.snp.makeConstraints{
            $0.leading.equalTo(person1.snp.trailing).offset(44)
            $0.top.equalTo(person2.snp.bottom).offset(26)
        }

        person4.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(person1.snp.bottom).offset(26)
        }
        person6.snp.makeConstraints{
            $0.leading.equalTo(person2.snp.trailing).offset(55)
            $0.top.equalTo(person1.snp.bottom).offset(26)
        }


    }
    
    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {

            let cgimage = image.cgImage!
            let contextImage: UIImage = UIImage(cgImage: cgimage)
            let contextSize: CGSize = contextImage.size
            var posX: CGFloat = 0.0
            var posY: CGFloat = 0.0
            var cgwidth: CGFloat = CGFloat(width)
            var cgheight: CGFloat = CGFloat(height)

            // See what size is longer and create the center off of that
            if contextSize.width > contextSize.height {
                posX = ((contextSize.width - contextSize.height) / 2)
                posY = 0
                cgwidth = contextSize.height
                cgheight = contextSize.height
            } else {
                posX = 0
                posY = ((contextSize.height - contextSize.width) / 2)
                cgwidth = contextSize.width
                cgheight = contextSize.width
            }

            let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)

            // Create bitmap image from context using the rect
            let imageRef: CGImage = cgimage.cropping(to: rect)!

            // Create a new image based on the imageRef and rotate back to the original orientation
            let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)

            return image
        }
  
}
//extension String {
//func withBoldText(text: String, font: UIFont? = nil) -> NSAttributedString {
//  let _font = font ?? UIFont.systemFont(ofSize: 14, weight: .regular)
//  let fullString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: _font])
//  let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: _font.pointSize)]
//  let range = (self as NSString).range(of: text)
//  fullString.addAttributes(boldFontAttribute, range: range)
//  return fullString
//}
//}



       

