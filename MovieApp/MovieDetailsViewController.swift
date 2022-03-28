//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by Emilia Haramina on 21.03.2022..
//

import Foundation
import UIKit

class MovieDetailsViewController: UIViewController {
    
    // TODO: view.safeAreaLayout()
    
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
    private var movieGenreAndTimeView: UIView!
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
    private var peopleJobsStackView = [UIStackView]()
    
    private var tmp = [UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        addConstraints()
    }
    
    private func buildViews() {
        movieImage = UIImage(named: "Spirited_Away.jpg")!
        movieImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        movieImageView.image = movieImage
        movieImageView.contentMode = .scaleAspectFill
        movieImageView.clipsToBounds = true
        movieImageView.layer.opacity = 0.55
        
        movieScore = UILabel()
        movieScore.text = "86"
        movieScore.textColor = .white
        movieScore.font = UIFont.boldSystemFont(ofSize: 12.5)
        
        movieScorePercentage = UILabel()
        movieScorePercentage.text = "%"
        movieScorePercentage.textColor = .white
        movieScorePercentage.font = movieScore.font.withSize(6)
        
        movieScoreLabel = UILabel()
        movieScoreLabel.text = "User Score"
        movieScoreLabel.textColor = .white
        movieScoreLabel.font = UIFont.boldSystemFont(ofSize: 12.5)
        
        movieScoreView = UIView()
        movieScoreView.addSubview(movieScore)
        movieScoreView.addSubview(movieScorePercentage)
        movieScoreView.addSubview(movieScoreLabel)
        
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
        
        movieGenreAndTimeView = UIView()
        movieGenreAndTimeView.addSubview(movieGenre)
        movieGenreAndTimeView.addSubview(movieTime)
        
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
        bannerView.addSubview(movieImageView)
        bannerView.addSubview(movieScoreView)
        bannerView.addSubview(movieNameAndYearView)
        bannerView.addSubview(movieDateAndPlaceView)
        bannerView.addSubview(movieGenreAndTimeView)
        bannerView.addSubview(favouriteView)
        
        overviewTitle = UILabel()
        overviewTitle.text = "Overview"
        overviewTitle.textColor = .black
        overviewTitle.font = UIFont.boldSystemFont(ofSize: 20)
        
        overviewText = UILabel()
        overviewText.text = "Ten-year-old Chihiro and her parents end up at an abandoned amusement park inhabited by supernatural beings. Soon, she learns that she must work to free her parents who have been turned into pigs."
        overviewText.numberOfLines = 0
        overviewText.textColor = .black
        overviewText.font = overviewText.font.withSize(12.5)
        
        // ovo je napravljeno ovako komplicirano cisto iz razloga da se kasnije, kada se ne zna koliko ce biti osoba
        // koje su radile na filmu, moze lakse stavljati na ekran
        var people = [Int: String]()
        var jobs = [Int: String]()
        people[0] = "Hayao Miyazaki"
        jobs[0] = "Director"
        people[1] = "Hayao Miyazaki"
        jobs[1] = "Writer"
        people[2] = "Toshio Suzuki"
        jobs[2] = "Producer"
        people[3] = "Atsushi Okui"
        jobs[3] = "Screenplay"
        // zakomentirani covjek je cisto radi isprobavanja layouta s vise/manje ljudi
//        people[4] = "Atsushi Okui"
//        jobs[4] = "Screenplay"
//        people[5] = "Atsushi Okui"
//        jobs[5] = "Screenplay"
//        people[6] = "Atsushi Okui"
//        jobs[6] = "Screenplay"
        
        var i = 0
        repeat {

            peopleLabel.append(UILabel())
            peopleLabel[i].text = people[i]
            peopleLabel[i].textColor = .black
            peopleLabel[i].font = UIFont.boldSystemFont(ofSize: 12.5)
            peopleLabel[i].numberOfLines = 0

            jobsLabel.append(UILabel())
            jobsLabel[i].text = jobs[i]
            jobsLabel[i].textColor = .black
            jobsLabel[i].font = jobsLabel[i].font.withSize(12.5)
            
            peopleJobsStackView.append(UIStackView())
            peopleJobsStackView[i].axis = .vertical
            peopleJobsStackView[i].alignment = .fill
            peopleJobsStackView[i].distribution = .fillEqually
            peopleJobsStackView[i].spacing = 2.5
            peopleJobsStackView[i].addArrangedSubview(peopleLabel[i])
            peopleJobsStackView[i].addArrangedSubview(jobsLabel[i])

            if (i % 3 == 0) {
                threePeopleView.append(UIStackView())
                threePeopleView[i / 3].axis = .horizontal
                threePeopleView[i / 3].alignment = .fill
                threePeopleView[i / 3].distribution = .fillEqually
                threePeopleView[i / 3].addArrangedSubview(peopleJobsStackView[i])
            } else {
                threePeopleView[i / 3].addArrangedSubview(peopleJobsStackView[i])
            }

            i = i + 1
        } while (i < people.count)

        if (i % 3 == 1) {
            peopleJobsStackView.append(UIStackView())
            peopleJobsStackView[i].axis = .vertical
            peopleJobsStackView[i].alignment = .fill
            peopleJobsStackView[i].distribution = .fillEqually
            peopleJobsStackView[i].backgroundColor = .white
            peopleJobsStackView.append(UIStackView())
            peopleJobsStackView[i + 1].axis = .vertical
            peopleJobsStackView[i + 1].alignment = .fill
            peopleJobsStackView[i + 1].distribution = .fillEqually
            peopleJobsStackView[i + 1].backgroundColor = .white
            threePeopleView[i / 3].addArrangedSubview(peopleJobsStackView[i])
            threePeopleView[i / 3].addArrangedSubview(peopleJobsStackView[i + 1])
        } else if (i % 3 == 2) {
            peopleJobsStackView.append(UIStackView())
            peopleJobsStackView[i].axis = .vertical
            peopleJobsStackView[i].alignment = .fill
            peopleJobsStackView[i].distribution = .fillEqually
            peopleJobsStackView[i].backgroundColor = .white
            threePeopleView[i / 3].addArrangedSubview(peopleJobsStackView[i])
        }

        peopleView = UIStackView()
        peopleView.axis = .vertical
        peopleView.alignment = .fill
        peopleView.distribution = .fillEqually
        peopleView.spacing = 23

        i = 0
        repeat {
            peopleView.addArrangedSubview(threePeopleView[i])
            i = i + 1
        } while (i < threePeopleView.count)
        
        overviewView = UIView()
        overviewView.backgroundColor = .white
        overviewView.addSubview(overviewTitle)
        overviewView.addSubview(overviewText)
        overviewView.addSubview(peopleView)
        
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        // mozda bolje .fill? ali za sad ne znam kako napraviti da se moze scrollati
        // mislim da se onda treba promijeniti i movieImageView.contentMode
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        stackView.addArrangedSubview(bannerView)
        stackView.addArrangedSubview(overviewView)
        
        view.addSubview(stackView)
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
            
        ])
        
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor),
            movieImageView.topAnchor.constraint(equalTo: bannerView.topAnchor),
            movieImageView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor)
        ])

        movieScoreView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieScoreView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor),
            movieScoreView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor)
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
            movieNameAndYearView.leadingAnchor.constraint(equalTo: movieScoreView.leadingAnchor),
            movieNameAndYearView.topAnchor.constraint(equalTo: movieScoreView.bottomAnchor, constant: 15)
        ])

        movieName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieName.leadingAnchor.constraint(equalTo: movieNameAndYearView.leadingAnchor, constant: 20)
        ])

        movieYear.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieYear.leadingAnchor.constraint(equalTo: movieName.trailingAnchor, constant: 2)
        ])

        movieDateAndPlaceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieDateAndPlaceView.leadingAnchor.constraint(equalTo: movieNameAndYearView.leadingAnchor),
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

        movieGenreAndTimeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieGenreAndTimeView.leadingAnchor.constraint(equalTo: movieDateAndPlaceView.leadingAnchor),
            movieGenreAndTimeView.topAnchor.constraint(equalTo: movieDateAndPlaceView.bottomAnchor, constant: 20),
            movieGenreAndTimeView.bottomAnchor.constraint(equalTo: favouriteView.topAnchor, constant: -25)
        ])

        movieGenre.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieGenre.leadingAnchor.constraint(equalTo: movieGenreAndTimeView.leadingAnchor, constant: 20)
        ])

        movieTime.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieTime.leadingAnchor.constraint(equalTo: movieGenre.trailingAnchor, constant: 2)
        ])
        
        favouriteView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favouriteView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 20),
            favouriteView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: -45)
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
            
        ])

        overviewTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewTitle.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 20),
            overviewTitle.topAnchor.constraint(equalTo: overviewView.topAnchor, constant: 20)
        ])

        overviewText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overviewText.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 20),
            overviewText.topAnchor.constraint(equalTo: overviewTitle.bottomAnchor, constant: 12.5),
            overviewText.trailingAnchor.constraint(equalTo: overviewView.trailingAnchor, constant: -20)
        ])

        peopleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            peopleView.leadingAnchor.constraint(equalTo: overviewView.leadingAnchor, constant: 20),
            peopleView.trailingAnchor.constraint(equalTo: overviewView.trailingAnchor, constant: -20),
            peopleView.topAnchor.constraint(equalTo: overviewText.bottomAnchor, constant: 20)
        ])

        var i = 0
        var j = 0
        repeat {
            threePeopleView[i].translatesAutoresizingMaskIntoConstraints = false
            
            repeat {
                peopleJobsStackView[j].translatesAutoresizingMaskIntoConstraints = false
                
                if (j < peopleLabel.count) {
                    peopleLabel[j].translatesAutoresizingMaskIntoConstraints = false
                    jobsLabel[j].translatesAutoresizingMaskIntoConstraints = false
                }

                j = j + 1
            } while (j < peopleLabel.count && j < (i + 1) * 3)

            i = i + 1;
        } while (i < threePeopleView.count)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
}
