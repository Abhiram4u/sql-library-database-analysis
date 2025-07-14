create database library_management;
use library_management;

create table  publisher(PublisherName varchar(255) primary key,
					   PublisherAddress text,
                       PUblisherPhone varchar(255)
                       );
                       
create table borrower(CardNo int primary key,
					  BorrowerName varchar(255),
                        BorrowerAddress text,
                        BorrowerPhone varchar(255)
						);
                        
create table library_branch(Branchid tinyint auto_increment primary key,
							BranchName varchar(255),
                            BranchAddress text
                            );
                            
create table books(BookID tinyint primary key,
				  Title varchar(255),
                  PublisherName varchar(255),
                  foreign key(PublisherName) references publisher(PublisherName) on update cascade on delete cascade
                  );
                  
create table authors(AuthorID tinyint auto_increment primary key,
					BookID tinyint,
                    AuthorName varchar(255),
                    foreign key(BookID) references books(BookID) on delete cascade on update cascade
                    );


                    
                    
create table book_copies(CopiesId tinyint auto_increment primary key,
						 BookId tinyint,
                         BranchID tinyint,
                         No_of_copies tinyint,
                         foreign key(BookID) references books(BookID) on delete cascade on update cascade,
                         foreign key(BranchID) references library_branch(BranchID) on delete cascade on update cascade
                         );

create table book_loans(LoansID smallint auto_increment primary key,
						BookID tinyint,
                        BranchID tinyint,
                        CardNo int,
                        DateOut varchar(255),
                        DueDAte varchar(255),
                        foreign key(BookId) references books(BookId) on delete cascade on update cascade,
                        foreign key(BranchId) references library_branch(BranchId) on delete cascade on update cascade,
                        foreign key(CardNo) references borrower(CardNo) on delete cascade on update cascade
							);

