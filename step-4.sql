-- select the park name, campground name, open_from_mm, open_to_mm & daily_fee ordered by park name and then campground name



-- select the park name and the total number of campgrounds for each park ordered by park name
select park.name, count(campground.name) as 'campgrounds per park' from campground
join park on park.park_id = campground.park_id
group by park.name
ORDER BY park.name

-- select the park name, campground name, site number, max occupancy, accessible, max rv length, utilities where the campground name is 'Blackwoods'



/*
  select park name, campground, total number of sites (column alias 'number_of_sites') ordered by park
  data should look like below:
  -------------------------------------------------
    park				campground							number_of_sites
	Acadia				Blackwoods							12
    Acadia				Seawall								12
    Acadia				Schoodic Woods						12
    Arches				"Devil's Garden"					8
    Arches				Canyon Wren Group Site				1
    Arches				Juniper Group Site					1
    Cuyahoga Valley		The Unnamed Primitive Campsites		5
  -------------------------------------------------
*/
select park.name, campground.name, count(site_number) as 'number_of_sites' from park
join campground on campground.park_id = park.park_id
join site on site.campground_id = campground.campground_id
group by park.name, campground.name
order by park.name



-- select site number, reservation name, reservation from and to date ordered by reservation from date




/*
  select campground name, total number of reservations for each campground ordered by total reservations desc
  data should look like below:
  -------------------------------------------------
    name								total_reservations
	Seawall								13
    Blackwoods							9
    "Devil's Garden"					7
    Schoodic Woods						7
    Canyon Wren Group Site				4
    Juniper Group Site					4
  -------------------------------------------------
*/
select campground.name, count(reservation_id) as 'total_reservations' from campground
join site on site.campground_id = campground.campground_id
join reservation on reservation.site_id = site.site_id
group by campground.name
order by 'total_reservations' desc;

