//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Emilia Haramina on 21.03.2022..
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    
//    private var button: UIButton!
//    private var label: UILabel!
//    private var container: UIView!
//    private var secondContainer: UIView!
//    private var yellowRectangle: UIView!
//    private var redRectangle: UIView!
//    private var greenRectangle: UIView!
//    private var whiteRectangle: UIView!
    private var stackView: UIStackView!
    
    private var bannerView: UIView!
    private var movieImage: UIImage!
    private var movieImageView: UIImageView!
    private var movieScore: UILabel!
    private var movieScorePercentage: UILabel!
    private var movieScoreLabel: UILabel!
    private var movieScoreView: UIView!
    private var movieName: UILabel!
    private var movieYear: UILabel!
    private var movieNameAndYearView: UIView!
    private var movieDate: UILabel!
    private var moviePlace: UILabel!
    private var movieDateAndPlaceView: UIView!
    private var movieGenre: UILabel!
    private var movieTime: UILabel!
    private var movieGenreAndTime: UIView!
    private var vectorCircle: UIImage!
    private var vectorCircleView: UIImageView!
    private var vectorStar: UIImage!
    private var vectorStarView: UIImageView!
    private var favouriteView: UIView!
    
    private var overviewView: UIView!
    private var overviewTitle: UILabel!
    private var overviewText: UILabel!
    
    private var peopleView: UIStackView!
    private var threePeopleView = [UIStackView]()
    private var peopleLabel = [UILabel]()
    private var jobsLabel = [UILabel]()
    private var peopleJobsView = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .yellow
        
//        let rectangle = UIView(
//            frame: CGRect(
//                x: 0,
//                y: 0,
//                width: 100,
//                height: 100))
//        rectangle.backgroundColor = .blue
//        view.addSubview(rectangle)
        buildViews()
        addConstraints()
    }
    
    private func buildViews() {
        movieImage = UIImage(named: "Spirited_Away.jpg")!
        movieImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        movieImageView.image = movieImage
        movieImageView.contentMode = .scaleAspectFit
        movieImageView.layer.opacity = 0.55
//        view.addSubview(movieImageView)
        
        movieScore = UILabel()
        movieScore.text = "86"
        movieScore.textColor = .white
//        movieScore.font = movieScore.font.withSize(20)
        movieScore.font = UIFont.boldSystemFont(ofSize: 12.5)
//        movieImageView.addSubview(movieScore)
        
        movieScorePercentage = UILabel()
        movieScorePercentage.text = "%"
        movieScorePercentage.textColor = .white
        movieScorePercentage.font = movieScore.font.withSize(6)
//        movieImageView.addSubview(movieScorePercentage)
        
        movieScoreLabel = UILabel()
        movieScoreLabel.text = "User Score"
        movieScoreLabel.textColor = .white
        movieScoreLabel.font = UIFont.boldSystemFont(ofSize: 12.5)
        
        movieScoreView = UIView()
        movieScoreView.addSubview(movieScore)
        movieScoreView.addSubview(movieScorePercentage)
        movieScoreView.addSubview(movieScoreLabel)
//        movieImageView.addSubview(movieScoreView)
        
        movieName = UILabel()
        movieName.text = "Spirited Away"
        movieName.textColor = .white
        movieName.font = UIFont.boldSystemFont(ofSize: 20)
        
        movieYear = UILabel()
        movieYear.text = "(2001)"
        movieYear.textColor = .white
        movieYear.font = movieYear.font.withSize(20)
        
        movieNameAndYearView = UIView()
        movieNameAndYearView.addSubview(movieName)
        movieNameAndYearView.addSubview(movieYear)
        
        movieDate = UILabel()
        movieDate.text = "20/07/2001"
        movieDate.textColor = .white
        movieDate.font = movieDate.font.withSize(12.5)
        
        moviePlace = UILabel()
        moviePlace.text = "(US)"
        moviePlace.textColor = .white
        moviePlace.font = moviePlace.font.withSize(12.5)
        
        movieDateAndPlaceView = UIView()
        movieDateAndPlaceView.addSubview(movieDate)
        movieDateAndPlaceView.addSubview(moviePlace)
        
        movieGenre = UILabel()
        movieGenre.text = "Fantasy, Adventure"
        movieGenre.textColor = .white
        movieGenre.font = movieGenre.font.withSize(12.5)
        
        movieTime = UILabel()
        movieTime.text = "2h 5m"
        movieTime.textColor = .white
        movieTime.font = UIFont.boldSystemFont(ofSize: 12.5)
        
        movieGenreAndTime = UIView()
        movieGenreAndTime.addSubview(movieGenre)
        movieGenreAndTime.addSubview(movieTime)
        
        vectorCircle = UIImage(systemName: "circle.fill")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        vectorCircleView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        vectorCircleView.image = vectorCircle
        vectorCircleView.contentMode = .scaleAspectFit
        vectorCircleView.layer.opacity = 0.4
        
        vectorStar = UIImage(systemName: "star")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        vectorStarView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        vectorStarView.image = vectorStar
        vectorStarView.contentMode = .scaleAspectFit
        
        favouriteView = UIView()
        favouriteView.addSubview(vectorCircleView)
        favouriteView.addSubview(vectorStarView)
        
        bannerView = UIView()
//        bannerView.addSubview(movieScoreView)
//        bannerView.addSubview(movieScore)
//        bannerView.addSubview(movieScorePercentage)
        bannerView.addSubview(movieImageView)
        bannerView.addSubview(movieScoreView)
//        bannerView.addSubview(movieName)
        bannerView.addSubview(movieNameAndYearView)
        bannerView.addSubview(movieDateAndPlaceView)
        bannerView.addSubview(movieGenreAndTime)
        bannerView.addSubview(favouriteView)
        
        overviewTitle = UILabel()
        overviewTitle.text = "Overview"
        overviewTitle.textColor = .black
        overviewTitle.font = UIFont.boldSystemFont(ofSize: 20)
        
        overviewText = UILabel()
        overviewText.text = "Ten-year-old Chihiro and her parents end up at an abandoned amusement park inhabitet by supernatural beings. Soon, she learns that she must work to free her parents who have been turned into pigs."
        overviewText.numberOfLines = 0
        overviewText.textColor = .black
        overviewText.font = overviewText.font.withSize(12.5)
        
        var people = [Int: String]()
        var jobs = [Int: String]()
        people[0] = "Hayao Miyazaki"
        jobs[0] = "Director"
        people[1] = "Hayao Miyazaki"
        jobs[1] = "Writter"
        people[2] = "Toshio Suzuki"
        jobs[2] = "Producer"
        people[3] = "Atsushi Okui"
        jobs[3] = "Screenplay"
        
        var i = 0
        repeat {
            
//            peopleLabel[i] = UILabel()
            peopleLabel.append(UILabel())
            peopleLabel[i].text = people[i]
            peopleLabel[i].textColor = .black
            peopleLabel[i].font = UIFont.boldSystemFont(ofSize: 12.5)
            peopleLabel[i].numberOfLines = 0
            
//            jobsLabel[i] = UILabel()
            jobsLabel.append(UILabel())
            jobsLabel[i].text = jobs[i]
            jobsLabel[i].textColor = .black
            jobsLabel[i].font = jobsLabel[i].font.withSize(12.5)
            
//            peopleJobsView[i] = UIView()
            peopleJobsView.append(UIView())
            peopleJobsView[i].backgroundColor = .white
            peopleJobsView[i].addSubview(peopleLabel[i])
            peopleJobsView[i].addSubview(jobsLabel[i])
            
            if (i % 3 == 0) {
//                threePeopleView[i % 3] = UIStackView()
                threePeopleView.append(UIStackView())
                threePeopleView[i % 3].axis = .horizontal
                threePeopleView[i % 3].alignment = .fill
                threePeopleView[i % 3].distribution = .fillEqually
                threePeopleView[i % 3].spacing = 0
                threePeopleView[i % 3].addArrangedSubview(peopleJobsView[i])
            } else if (i % 3 == 1) {
                threePeopleView[(i % 3) - 1].addArrangedSubview(peopleJobsView[i])
            } else {
                threePeopleView[(i % 3) - 2].addArrangedSubview(peopleJobsView[i])
            }
            
            i = i + 1
        } while (i < people.count)
        
        peopleView = UIStackView()
        peopleView.axis = .vertical
        peopleView.alignment = .fill
        peopleView.distribution = .fillEqually
        peopleView.spacing = 0
        
        i = 0
        repeat {
            peopleView.addArrangedSubview(threePeopleView[i])
            i = i + 1
        } while (i < threePeopleView.count)
        
        overviewView = UIView()
        overviewView.backgroundColor = .white
        overviewView.addSubview(overviewTitle)
        overviewView.addSubview(overviewText)
//        overviewView.addSubview(peopleLabel[0])
        overviewView.addSubview(peopleView)
        
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        stackView.addArrangedSubview(bannerView)
        stackView.addArrangedSubview(overviewView)
        
        view.addSubview(stackView)
        
//        createViews()
//        styleViews()
//        defineLayoutForViews()
        
//        let yellowRectangle = UIView()
//        view.addSubview(yellowRectangle)
//        yellowRectangle.backgroundColor = .systemYellow
//        yellowRectangle.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        
//        view.backgroundColor = .systemBlue
        
        // Primjer 1: Stvaranje UIView koristeci okvir
//        let bounds = UIScreen.main.bounds
//
//        yellowRectangle = UIView()
//        yellowRectangle.backgroundColor = .systemYellow
//        yellowRectangle.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
//
//        redRectangle = UIView()
//        redRectangle.backgroundColor = .systemRed
////        redRectangle.frame = CGRect(x: 304, y: 100, width: 100, height: 100)
//        redRectangle.frame = CGRect(x: (bounds.width - 100 - 10), y: 100, width: 100, height: 100)
//
//        greenRectangle = UIView()
//        greenRectangle.backgroundColor = .systemGreen
////        greenRectangle.frame = CGRect(x: 157, y: 398, width: 100, height: 100)
//        greenRectangle.frame = CGRect(x: (bounds.width / 2 - 50), y: (bounds.height / 2 - 50), width: 100, height: 100)
//
//        view.addSubview(yellowRectangle)
//        view.addSubview(redRectangle)
//        view.addSubview(greenRectangle)
        
        // Primjer 2: Stvaranje UIView koristeci NSLayoutConstraint
        // Primjer 3: Stvaranje UIView koristeci NSLayoutConstraint
//        yellowRectangle = UIView()
//        yellowRectangle.backgroundColor = .systemYellow
//
//        redRectangle = UIView()
//        redRectangle.backgroundColor = .systemRed
//
//        greenRectangle = UIView()
//        greenRectangle.backgroundColor = .systemGreen
//
//        whiteRectangle = UIView()
//        whiteRectangle.backgroundColor = .white
//
//        view.addSubview(yellowRectangle)
//        view.addSubview(redRectangle)
//        view.addSubview(greenRectangle)
//        view.addSubview(whiteRectangle)
    }
    
    private func addConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false;
        NSLayoutConstraint.activate([
//            bannerView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
//            bannerView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//            bannerView.topAnchor.constraint(equalTo: stackView.topAnchor),
//            bannerView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
        
        movieScoreView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieScoreView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            movieScoreView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor),
            movieScoreView.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor, constant: 20)
//            movieScoreView.topAnchor.constraint(equalTo: bannerView.topAnchor),
//            movieScoreView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor)
        ])
        
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor),
            movieImageView.topAnchor.constraint(equalTo: bannerView.topAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor)
        ])
        
        movieScore.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieScore.leadingAnchor.constraint(equalTo: movieScoreView.leadingAnchor, constant: 30),
            movieScore.centerYAnchor.constraint(equalTo: movieScoreView.centerYAnchor)
        ])
        
        movieScorePercentage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieScorePercentage.leadingAnchor.constraint(equalTo: movieScore.trailingAnchor),
            movieScorePercentage.centerYAnchor.constraint(equalTo: movieScore.centerYAnchor, constant: 2.7)
        ])
        
        movieScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieScoreLabel.leadingAnchor.constraint(equalTo: movieScorePercentage.trailingAnchor, constant: 10),
            movieScoreLabel.centerYAnchor.constraint(equalTo: movieScore.centerYAnchor)
        ])
        
        movieNameAndYearView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieNameAndYearView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            movieNameAndYearView.topAnchor.constraint(equalTo: movieScoreView.bottomAnchor, constant: 15)
        ])
        
        movieName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieName.leadingAnchor.constraint(equalTo: movieNameAndYearView.leadingAnchor, constant: 20)
//            movieName.topAnchor.constraint(equalTo: movieScoreView.bottomAnchor)
        ])
        
        movieYear.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieYear.leadingAnchor.constraint(equalTo: movieName.trailingAnchor, constant: 2)
        ])
        
        movieDateAndPlaceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieDateAndPlaceView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            movieDateAndPlaceView.topAnchor.constraint(equalTo: movieNameAndYearView.bottomAnchor, constant: 30)
        ])
        
        movieDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieDate.leadingAnchor.constraint(equalTo: movieDateAndPlaceView.leadingAnchor, constant: 20)
        ])
        
        moviePlace.translatesAutoresizingMaskIntoConstraints = false;
        NSLayoutConstraint.activate([
            moviePlace.leadingAnchor.constraint(equalTo: movieDate.trailingAnchor, constant: 2)
        ])
        
        movieGenreAndTime.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieGenreAndTime.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            movieGenreAndTime.topAnchor.constraint(equalTo: movieDateAndPlaceView.bottomAnchor, constant: 20)
        ])
        
        movieGenre.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieGenre.leadingAnchor.constraint(equalTo: movieGenreAndTime.leadingAnchor, constant: 20)
        ])
        
        movieTime.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieTime.leadingAnchor.constraint(equalTo: movieGenre.trailingAnchor, constant: 2)
        ])
        
        favouriteView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favouriteView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 20),
            favouriteView.topAnchor.constraint(equalTo: movieDateAndPlaceView.bottomAnchor, constant: 38.5)
        ])

        vectorCircleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vectorCircleView.leadingAnchor.constraint(equalTo: favouriteView.leadingAnchor),
            vectorCircleView.trailingAnchor.constraint(equalTo: favouriteView.leadingAnchor, constant: 30),
            vectorCircleView.topAnchor.constraint(equalTo: favouriteView.topAnchor),
            vectorCircleView.bottomAnchor.constraint(equalTo: favouriteView.bottomAnchor, constant: 30),
            vectorCircleView.heightAnchor.constraint(equalToConstant: 30),
            vectorCircleView.widthAnchor.constraint(equalToConstant: 30)
        ])

        vectorStarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vectorStarView.leadingAnchor.constraint(equalTo: vectorCircleView.leadingAnchor, constant: 7.5),
            vectorStarView.trailingAnchor.constraint(equalTo: vectorCircleView.trailingAnchor, constant: -7.5),
            vectorStarView.topAnchor.constraint(equalTo: vectorCircleView.topAnchor, constant: 7.5),
            vectorStarView.bottomAnchor.constraint(equalTo: vectorCircleView.bottomAnchor, constant: -7.5),
            vectorStarView.heightAnchor.constraint(equalToConstant: 15),
            vectorStarView.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        overviewView.translatesAutoresizingMaskIntoConstraints = false;
        NSLayoutConstraint.activate([
//            bannerView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
//            bannerView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//            bannerView.topAnchor.constraint(equalTo: stackView.topAnchor),
//            bannerView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
        
        overviewTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewTitle.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 20),
            overviewTitle.topAnchor.constraint(equalTo: overviewView.topAnchor, constant: 20)
        ])
        
        overviewText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewText.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 20),
            overviewText.topAnchor.constraint(equalTo: overviewTitle.bottomAnchor, constant: 20),
            overviewText.trailingAnchor.constraint(equalTo: overviewView.trailingAnchor, constant: -20)
        ])
        
        peopleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            peopleView.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 20),
            peopleView.topAnchor.constraint(equalTo: overviewText.bottomAnchor, constant: 20)
        ])
        
        var i = 0
        var j = 0
        repeat {
            threePeopleView[i].translatesAutoresizingMaskIntoConstraints = false
            if (i == 0) {
                NSLayoutConstraint.activate([
                    threePeopleView[i].leadingAnchor.constraint(equalTo: peopleView.leadingAnchor),
                    threePeopleView[i].topAnchor.constraint(equalTo: peopleView.topAnchor)
                ])
            } else {
                NSLayoutConstraint.activate([
                    threePeopleView[i].leadingAnchor.constraint(equalTo: peopleView.leadingAnchor),
                    threePeopleView[i].topAnchor.constraint(equalTo: threePeopleView[i - 1].bottomAnchor, constant: 20)
//                    threePeopleView[i].topAnchor.constraint(equalTo: peopleView.topAnchor, constant: 200)
                ])
            }
            
            repeat {
                peopleJobsView[j].translatesAutoresizingMaskIntoConstraints = false
//                if (j == 0) {
                var offset: Float
                if (j % 3 == 0) {
                    offset = 0
                } else if (j % 3 == 1) {
                    offset = 100
                } else {
                    offset = 200
                }
                    NSLayoutConstraint.activate([
                        peopleJobsView[j].leadingAnchor.constraint(equalTo: threePeopleView[i].leadingAnchor, constant: CGFloat(offset))
                    ])
//                } else {
//                    NSLayoutConstraint.activate([
//                        peopleJobsView[j].leadingAnchor.constraint(equalTo: peopleJobsView[j - 1].trailingAnchor, constant: 100),
//                    ])
//                }
                
                peopleLabel[j].translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    peopleLabel[j].leadingAnchor.constraint(equalTo: peopleJobsView[j].leadingAnchor),
                    peopleLabel[j].topAnchor.constraint(equalTo: peopleJobsView[j].topAnchor)
                ])
                
                jobsLabel[j].translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    jobsLabel[j].leadingAnchor.constraint(equalTo: peopleJobsView[j].leadingAnchor),
                    jobsLabel[j].topAnchor.constraint(equalTo: peopleLabel[j].bottomAnchor, constant: 10)
                ])
                
                j = j + 1
            } while (j < peopleJobsView.count && j < (i + 1) * 3)
            
            i = i + 1;
        } while (i < threePeopleView.count)
        
        // Primjer 2: Stvaranje UIView koristeci NSLayoutConstraint
//        yellowRectangle.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            yellowRectangle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            yellowRectangle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            yellowRectangle.heightAnchor.constraint(equalToConstant: 100),
//            yellowRectangle.widthAnchor.constraint(equalToConstant: 100)
//        ])
//
//        redRectangle.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            redRectangle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//            redRectangle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            redRectangle.heightAnchor.constraint(equalToConstant: 100),
//            redRectangle.widthAnchor.constraint(equalToConstant: 100)
//        ])
//
//        greenRectangle.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            greenRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            greenRectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            greenRectangle.heightAnchor.constraint(equalToConstant: 100),
//            greenRectangle.widthAnchor.constraint(equalToConstant: 100)
//        ])
        
        // Primjer 3: Stvaranje UIView koristeci NSLayoutConstraint
//        yellowRectangle.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            yellowRectangle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
//            yellowRectangle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            yellowRectangle.heightAnchor.constraint(equalToConstant: 100)
//        ])
//
//        redRectangle.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            redRectangle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
//            redRectangle.leadingAnchor.constraint(equalTo: yellowRectangle.trailingAnchor, constant: 10),
//            redRectangle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
//            redRectangle.heightAnchor.constraint(equalToConstant: 100),
//            redRectangle.widthAnchor.constraint(equalTo: yellowRectangle.widthAnchor)
//        ])
//
//        greenRectangle.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            greenRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            greenRectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            greenRectangle.heightAnchor.constraint(equalTo: redRectangle.heightAnchor),
//            greenRectangle.widthAnchor.constraint(equalTo: redRectangle.widthAnchor)
//        ])
//
//        whiteRectangle.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            whiteRectangle.centerXAnchor.constraint(equalTo: greenRectangle.centerXAnchor),
//            whiteRectangle.topAnchor.constraint(equalTo: greenRectangle.bottomAnchor, constant: 20),
//            whiteRectangle.heightAnchor.constraint(equalToConstant: 50),
//            whiteRectangle.widthAnchor.constraint(equalToConstant: 50)
//        ])
        
        // Primjer 4: Stvaranje UIView koristeci PureLayout
//        yellowRectangle.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Primjer 1: Stvaranje UIView koristeci okvir
//        let bounds = UIScreen.main.bounds
//
//        yellowRectangle.frame = CGRect(x: 10, y: 100, width: 100, height: 100)
//        redRectangle.frame = CGRect(x: (bounds.width - 100 - 10), y: 100, width: 100, height: 100)
//        greenRectangle.frame = CGRect(x: (bounds.width / 2 - 50), y: (bounds.height / 2 - 50), width: 100, height: 100)
    }
    
//    private func createViews() {
//        container = UIView()
//        secondContainer = UIView()
//        container.addSubview(secondContainer)
//
//        label = UILabel()
//        secondContainer.addSubview(label)
//        label.text = "Labela"
//
//        button = UIButton()
//        secondContainer.addSubview(button)
//        button.setTitle("Gumb", for: .normal)
//    }
    
//    private func styleViews() {
//        view.backgroundColor = .blue
//        label.textColor = .white
//        button.backgroundColor = .red
//    }
    
    // NSLayoutConstraint
//    private func defineLayoutForViews() {
//        container.translatesAutoresizingMaskIntoConstraints = false
//        secondContainer.translatesAutoresizingMaskIntoConstraints = false
//        button.translatesAutoresizingMaskIntoConstraints = false
//        label.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//
//            secondContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
//            secondContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
//            secondContainer.topAnchor.constraint(equalTo: container.topAnchor, constant: -10),
//            secondContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -10),
//
//            button.widthAnchor.constraint(equalToConstant: 200),
//            button.heightAnchor.constraint(equalToConstant: 50),
//            button.topAnchor.constraint(equalTo: secondContainer.topAnchor),
//            button.leadingAnchor.constraint(equalTo: secondContainer.leadingAnchor),
//            button.trailingAnchor.constraint(equalTo: secondContainer.trailingAnchor),
//
//            label.leadingAnchor.constraint(equalTo: secondContainer.leadingAnchor),
//            label.trailingAnchor.constraint(equalTo: secondContainer.trailingAnchor),
//            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 40),
//            label.bottomAnchor.constraint(equalTo: secondContainer.bottomAnchor)
//        ])
//    }
    
    // Pure Layout
//    private func defineLayoutForViews() {
//        container.autoCenterInSuperview()
//        secondContainer.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//
//        button.autoSetDimension(.width, toSize: 200)
//        button.autoSetDimension(.height, toSize: 50)
//        button.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
//
//        label.autoPinEdge(.top, to: .bottom, of: button, withOffset: 40)
//        label.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
//    }
    
    // Snap Kit
//    private func defineLayoutForViews() {
//        container.snp.makeConstraints { make -> Void in
//            make.center.equalToSuperview()
//        }
//
//        secondContainer.snp.makeConstraints { make -> Void in
//            make.edges.equalToSuperview().inset(10)
//        }
//
//        button.snp.makeConstraints { make -> Void in
//            make.size.equalTo(CGSize(width: 200, height: 50))
//            make.top.leading.trailing.equalToSuperview()
//        }
//
//        label.snp.makeConstraints {
//            $0.top.equalTo(button.snp.bottom).offset(40)
//            $0.bottom.leading.trailing.equalToSuperview()
//        }
//    }
    
}
