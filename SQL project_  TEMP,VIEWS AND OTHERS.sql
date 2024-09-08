

--select location, MAX(total_deaths) as totalDeathCount
--from  project..CovidDeaths
--group by location
--order by totalDeathCount Desc
--  --------------------------------by Contitents---

select  MAX  (total_deaths) AS totalDeathCount
from  project..CovidDeaths
group by location
order by totalDeathCount Desc

select * from..CovidDeaths

with PopvsVac( states, location,date,population, New_vaccinations, RollingPeopleVaccinated as (
select dea. states,dea.location, dea.date, population,vac. new_vaccinations,
sum (convert(int, vac. new_vaccinations)) OVER (partition by dea.location order by dea.location,dea.Date)
from CovidDeaths dea
join CovidVaccinations vac
on  dea.location =vac. location
and dea.date = vac. date
where dea.states is not null 
order by 2,3
)
-------------------TEMP TABLE-----
create table #percentPopulationVaccinated
(
CONtitnent nvarchar(325),
location nvarchar(325),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)
insert into #percentPopulationVaccinated
select dea. states,dea.location, dea.date, population,vac. new_vaccinations,
sum (convert(int, vac. new_vaccinations)) OVER (partition by dea.location order by dea.location,dea.Date)
from CovidDeaths dea
join CovidVaccinations vac
on  dea.location =vac. location
and dea.date = vac. date
where dea.states is not null 
order by 2,3
---------------------------VIEWS---
- create views
create view percentpopulationVaccinated 
AS
select dea.continent, dea. location, dea.population, Vac. new_vaccinations, SUM(convert(int, vac. new_vaccinations))
over (partition by dea.location order by dea.location,dea.date) AS RollingPeopleVaccinated
from Project.. CovidDeaths dea
join Project.. CovidVaccinations vac
on dea. location = vac. location
and dea.date = vac.date
