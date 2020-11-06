package com.biz.team.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.biz.team.mapper.TeamDao;
import com.biz.team.model.TeamVO;

@Service("teamServiceV1")
public class TeamServiceImplV1 implements TeamService {

	@Autowired
	private TeamDao teamDao;

	@Autowired
	@Qualifier("fileServiceV1")
	private FileService fileService;

	@Override
	public List<TeamVO> selectAll(String category) {
		// TODO Auto-generated method stub
		return teamDao.selectAll(category);
	}

	@Override
	public TeamVO findBySeq(long seq) {
		// TODO Auto-generated method stub
		return teamDao.findBySeq(seq);
	}

	@Override
	public void insert(TeamVO teamVO, MultipartFile file) {

		String fileName = fileService.fileUp(file);
		teamVO.setH_file(fileName);
		teamDao.insert(teamVO);
	}

	@Override
	public int update(TeamVO teamVO,MultipartFile file) {
		
		long id = teamVO.getH_seq();
		
		TeamVO teamOldVO = teamDao.findBySeq(id);

		boolean file1_ex = file.getOriginalFilename().isEmpty();
		
		if (!file1_ex) {
			String file_1_Name = fileService.fileUp(file);
			// 3-3 DB에 저장된 데이터에 파일이름이 있는지 검사
			if (teamOldVO.getH_file() != null && !teamOldVO.getH_file().isEmpty()) {
				// 3-4 있으면 서버에서 파일을 삭제
				fileService.fileDelete(teamOldVO.getH_file());
			}
			// 3-5 새로변경된 파일이름을 vo에 저장하여 update 준비
			teamVO.setH_file(file_1_Name);
			// 3-6 upload된 파일이 없으면
		} else if (file1_ex) {
			// 3-7 DB에서 추출한 vo에서 파일이름을 저장하여
			teamVO.setH_file(teamOldVO.getH_file());
		}
		
		int ret = teamDao.update(teamVO);
		return ret;
	}

	@Override
	public int delete(long seq) {
		TeamVO teamVO = teamDao.findBySeq(seq);

		String h_file = teamVO.getH_file();
		if (h_file != null) {
			fileService.fileDelete(h_file);
		}
		return teamDao.delete(seq);
	}

}
