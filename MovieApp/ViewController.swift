//
//  ViewController.swift
//  MovieApp
//
//  Created by FIVE on 27.03.2022..
//
import SnapKit
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    private var movieImage = UIImageView()
    private var movieTitle = UILabel()
    private var movieDate = UILabel()
    private var genres = UILabel()
    private var duration = UILabel()
    private var scorePrecentage = UILabel()
    private var scoreLabel = UILabel()
    private var overview = UILabel()
    private var starIcon = UIImageView()
    private var descript = UILabel()
    private var peopleCollectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor(white: 1, alpha: 1)
        setUpSubviews()
        setUpConstraints()
                                       
    }
    private func setUpSubviews() {
    
        movieImage.image = cropToBounds(image: UIImage(named: "iron man")!, width: 363, height: 303)
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
        
        descript.text = "After being held captive in an Afghan cave, /n billionare engineer Tony Stark creates a unique /n weaponized suit of armor to fight evil. "
        descript.numberOfLines = 0;
        descript.textColor = .black
        descript.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(descript)
        
        overview.text = "Overwiew"
        overview.textColor = .black
        overview.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(overview)
        
        duration.text = "2h 6m"
        duration.font = UIFont.boldSystemFont(ofSize: 14)
        duration.textColor = .white
        view.addSubview(duration)
        
        starIcon.image = UIImage(systemName: "star.circle")!
        let config = UIImage.SymbolConfiguration(paletteColors: [.white, .gray])
        starIcon.backgroundColor = .gray
        starIcon.preferredSymbolConfiguration = config
        //starIcon.preferredImageVariantShape = UIImage.VariantShape.circle
        view.addSubview(starIcon)
        starIcon.layer.cornerRadius = 16
        
        peopleCollectionView.delegate  = self
        
        
    

        
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
        scoreLabel.snp_makeConstraints{
            $0.centerY.equalTo(scorePrecentage)
            $0.leading.equalTo(scorePrecentage.snp.trailing).offset(25)
            }
        
        starIcon.snp.makeConstraints{
            $0.top.equalTo(genres.snp.bottom).offset(10)
            $0.leading.equalTo(movieImage).inset(20)
            $0.width.height.equalTo(32)
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
